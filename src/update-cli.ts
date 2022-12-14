import { program } from '@caporal/core';
import { execSync } from 'child_process';
import fs from 'fs';
import assert from 'assert';
import tmp from 'tmp';
import path from 'path';
import { compile } from 'handlebars';
import { Octokit } from 'octokit';

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

const setBranchToCommit = async (
  octo: Octokit,
  branch: string,
  commitSha: string
) =>
  octo.rest.git.updateRef({
    owner: 'fragment-dev',
    repo: 'homebrew-tap',
    ref: `heads/${branch}`,
    sha: commitSha,
  });

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
  .option('--shasum <shasum>', 'Shasum of the tarball', {
    required: true,
    validator: program.STRING,
  })
  .option('--cli-version <version>', 'CLI Version', {
    required: true,
    validator: program.STRING,
  })
  .option('--dry-run', 'Flag to specify whether or not to push to Github', {
    validator: program.BOOLEAN,
  })
  .action(async ({ logger, options }) => {
    const { stage, shasum, cliVersion, dryRun } = options;
    assert(cliVersion && typeof cliVersion === 'string');
    const packageName = stage === 'dev' ? 'fragment-cli-beta' : 'fragment-cli';
    const url = `https://${stage}-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v${cliVersion}.tar.gz`;
    const cwd = process.cwd();
    process.chdir(tmp.dirSync({ keep: false }).name);
    const curlCommand = `curl --fail -L ${url} --output fragment-cli.tar.gz`;
    logger.info(curlCommand);
    execSync(curlCommand);

    const verifiedShasum = execSync('shasum -a 256 fragment-cli.tar.gz')
      .toString()
      .trim()
      .split(' ')[0];
    logger.info(
      `Shasum from package: ${verifiedShasum}. Shasum from webhook: ${shasum}`
    );
    if (verifiedShasum !== shasum) {
      throw new Error(
        `Mismatch in shasums. Shasum from package: ${verifiedShasum}. Shasum from webhook: ${shasum}`
      );
    }
    process.chdir(cwd);

    const outputPath = path.resolve(`./Formula/${packageName}.rb`);
    const templatePath = path.resolve(`./templates/${packageName}.rb`);
    const updatedFormula = compile(fs.readFileSync(templatePath).toString())({
      url,
      shasum,
      version: cliVersion,
    });
    const packageJsonPath = path.resolve('package.json');
    const packageJsonContents = JSON.parse(
      fs.readFileSync(packageJsonPath).toString()
    );
    packageJsonContents.versions = {
      ...packageJsonContents.versions,
      [String(stage)]: cliVersion,
    };
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
