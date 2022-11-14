import { program } from '@caporal/core';
import fs from 'fs';
import path from 'path';
import { compile } from 'handlebars';

program
  .option('--stage <stage>', 'Stage (dev/prod)', {
    required: true,
    validator: ['dev', 'prod'],
  })
  .option('--shasum <shasum>', 'Shasum of the tarball', { required: true })
  .option('--cli-version <version>', 'CLI Version', {
    required: true,
  })
  .action(({ logger, options }) => {
    const { stage, shasum, version } = options;
    const outputPath = path.resolve('../Formula/fragment-cli.rb');
    const templatePath = path.resolve('../templates/fragment-cli.rb');
    const updatedFormula = compile(fs.readFileSync(templatePath).toString())({
      url:
        stage === 'prod'
          ? 'https://fragment-cli.s3.amazonaws.com/fragment-cli.tar.gz'
          : 'https://fragment-cli-dev.s3.us-west-2.amazonaws.com/fragment-cli.tar.gz',
      shasum,
      version,
    });
    logger.info(updatedFormula);
    fs.writeFileSync(outputPath, updatedFormula);
    logger.info('hi');
  });

program.run();
