import { buildSetup } from './buildSetup';
import { writeFileSync } from 'fs';

const build = () => {
    writeFileSync('funcs/setup.sh', buildSetup());
};

build();
