import { program } from '@caporal/core';
import { execSync } from 'child_process';
import fs from 'fs';
import assert from 'assert';
import tmp from 'tmp';
import path from 'path';
import { compile } from 'handlebars';

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
    validator: (val) => {
      if (typeof val === 'string') {
        if (!val.startsWith('v')) {
          throw new Error(
            `Prod release attemped with invalid release version: ${val}`
          );
        }
        // strip 'v' prefix from GH release tag
        return val.substring(1);
      }
      if (typeof val === 'number') {
        // just some dummy
        return `1.${val}.0`;
      }
      throw new Error('Invalid type');
    },
  })
  .option('--dry-run', 'Flag to specify whether or not to push to Github', {
    validator: program.BOOLEAN,
  })
  .action(({ logger, options }) => {
    const { stage, shasum, cliVersion, dryRun } = options;
    assert(cliVersion && typeof cliVersion === 'string');
    const packageName = stage === 'dev' ? 'fragment-cli@next' : 'fragment-cli';
    const url =
      stage === 'prod'
        ? 'https://fragment-cli.s3.amazonaws.com/fragment-cli.tar.gz'
        : 'https://fragment-cli-dev.s3.us-west-2.amazonaws.com/fragment-cli.tar.gz';

    const cwd = process.cwd();
    process.chdir(tmp.dirSync({ keep: false }).name);
    execSync(`curl -L ${url} --output graphite-cli.zip`);

    const verifiedShasum = execSync('shasum -a 256 graphite-cli.zip')
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
    logger.info(updatedFormula);
    fs.writeFileSync(outputPath, updatedFormula);

    if (dryRun) {
      logger.info('Dry run mode specified, not pushing to github');
      return;
    }
  });

program.run();
