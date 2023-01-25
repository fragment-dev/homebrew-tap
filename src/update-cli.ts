import { program } from '@caporal/core';
import { execSync } from 'child_process';
import fs from 'fs';
import assert from 'assert';
import tmp from 'tmp';
import path from 'path';
import { compile } from 'handlebars';
import { Octokit } from 'octokit';

type Architecture = 'darwin-x64' | 'darwin-arm64' | 'linux-x64';

const getCurrentCommit = async (octo: Octokit) => {
  const { data: refData } = await octo.rest.git.getRef({
    owner: 'fragment-dev',
    repo: 'homebrew-tap',
    ref: `heads/main`,
  });
  const commitSha = refData.object.sha;
  const { data: commitData } = await octo.rest.git.getCommit({
    owner: 'fragment-dev',
    repo: 'homebrew-tap',
    commit_sha: commitSha,
  });
  return {
    commitSha,
    treeSha: commitData.tree.sha,
  };
};

// Notice that readFile's utf8 is typed differently from Github's utf-8
const getFileAsUTF8 = (filePath: string) => fs.readFileSync(filePath, 'utf8');

const createBlobForFile = (octo: Octokit) => async (filePath: string) => {
  const content = await getFileAsUTF8(filePath);
  const blobData = await octo.rest.git.createBlob({
    owner: 'fragment-dev',
    repo: 'homebrew-tap',
    content,
    encoding: 'utf-8',
  });
  return blobData.data;
};
type Blob = {
  url: string;
  sha: string;
};

const createNewTree = async (
  octo: Octokit,
  blobs: Blob[],
  paths: string[],
  parentTreeSha: string
) => {
  assert(blobs.length === paths.length);
  // My custom config. Could be taken as parameters
  const tree = blobs.map(({ sha }, index) => ({
    path: paths[index] as string,
    mode: '100644' as const,
    type: 'blob' as const,
    sha,
  }));
  assert(tree !== undefined);
  const { data } = await octo.rest.git.createTree({
    owner: 'fragment-dev',
    repo: 'homebrew-tap',
    tree,
    base_tree: parentTreeSha,
  });
  return data;
};

const createNewCommit = async (
  octo: Octokit,
  message: string,
  currentTreeSha: string,
  currentCommitSha: string
) =>
  (
    await octo.rest.git.createCommit({
      owner: 'fragment-dev',
      repo: 'homebrew-tap',
      message,
      tree: currentTreeSha,
      parents: [currentCommitSha],
    })
  ).data;

program
  .option('--stage <stage>', 'Stage (dev/prod)', {
    required: true,
    validator: ['dev', 'prod'],
  })
  .option('--cli-version <version>', 'CLI Version', {
    required: true,
    validator: program.STRING,
  })
  .option('--dry-run', 'Flag to specify whether or not to push to Github', {
    validator: program.BOOLEAN,
  })
  .action(async ({ logger, options }) => {
    const { stage, cliVersion, dryRun } = options;
    assert(cliVersion && typeof cliVersion === 'string');
    const packageName = stage === 'dev' ? 'fragment-cli-beta' : 'fragment-cli';

    const cwd = process.cwd();
    process.chdir(tmp.dirSync({ keep: false }).name);
    const getUrl = (architecture: Architecture) =>
      `https://${stage}-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v${cliVersion}-${architecture}.tar.gz`;
    const curl = (architecture: Architecture) => {
      const command = `curl --fail -L ${getUrl(
        architecture
      )} --output fragment-cli-${architecture}.tar.gz`;
      logger.info(command);
      return command;
    };
    const getShasum = (arch: Architecture) => {
      const shasum = execSync(`shasum -a 256 fragment-cli-${arch}.tar.gz`)
        .toString()
        .trim()
        .split(' ')[0];
      logger.info(shasum || '');
      return shasum;
    };

    execSync(curl('darwin-x64'));
    execSync(curl('darwin-arm64'));
    execSync(curl('linux-x64'));
    logger.info('Pulled tarballs from S3');
    const darwinX64Shasum = getShasum('darwin-x64');
    const linuxX64Shasum = getShasum('linux-x64');
    const darwinArm64Shasum = getShasum('darwin-arm64');

    process.chdir(cwd);

    const outputPath = path.resolve(`./Formula/${packageName}.rb`);
    const templatePath = path.resolve(`./templates/${packageName}.rb`);
    const updatedFormula = compile(fs.readFileSync(templatePath).toString())({
      darwinX64Shasum,
      linuxX64Shasum,
      darwinArm64Shasum,
      darwinX64Url: getUrl('darwin-arm64'),
      linuxX64Url: getUrl('darwin-arm64'),
      darwinArm64Url: getUrl('darwin-arm64'),
      version: cliVersion,
    });

    const packageJsonPath = path.resolve('package.json');
    const packageJsonContents = JSON.parse(
      fs.readFileSync(packageJsonPath).toString()
    );
    packageJsonContents[String(stage)] = cliVersion;
    console.log(packageJsonContents);
    fs.writeFileSync(
      packageJsonPath,
      JSON.stringify(packageJsonContents, null, 2)
    );

    logger.info(updatedFormula);
    fs.writeFileSync(outputPath, updatedFormula);

    if (dryRun) {
      logger.info('Dry run mode specified, not pushing to github');
      return;
    }
    if (!process.env['GITHUB_AUTH_TOKEN']) {
      throw new Error('GITHUB_AUTH_TOKEN must be set');
    }
    const octo = new Octokit({
      auth: process.env['GITHUB_AUTH_TOKEN'],
    });
    const { commitSha, treeSha } = await getCurrentCommit(octo);
    const filePaths = [
      path.resolve('package.json'),
      path.resolve('./Formula/fragment-cli.rb'),
      path.resolve('./Formula/fragment-cli-beta.rb'),
    ];
    const fileBlobs = await Promise.all(filePaths.map(createBlobForFile(octo)));
    const pathsForBlobs = filePaths.map((fullPath) =>
      path.relative('.', fullPath)
    );
    const newTree = await createNewTree(
      octo,
      fileBlobs,
      pathsForBlobs,
      treeSha
    );
    const newCommit = await createNewCommit(
      octo,
      `[automated] Update ${stage} CLI`,
      newTree.sha,
      commitSha
    );
    logger.info(`Updating main branch to ${newCommit.sha}`);
  });

program.run();
