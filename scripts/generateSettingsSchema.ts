import { compile, JSONSchema } from 'json-schema-to-typescript';
import { readFileSync, writeFileSync } from 'fs';
import * as ora from 'ora';

const getSchema = (): JSONSchema =>
    JSON.parse(readFileSync('schemas/settings.json', 'utf-8'));

const generateSchema = async () => {
    const orb = ora('Generating Schema').start();
    const schema = getSchema();
    const schemaInterface = await compile(schema, 'CLI');
    writeFileSync(
        'scripts/build/settings/generatedSchemaInterface.ts',
        schemaInterface,
    );
    orb.succeed('Generated Schema');
};

generateSchema();
