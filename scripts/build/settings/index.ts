import { readFileSync } from 'fs';
import {
    MacOSSettingsInstructions,
    Options,
    Application,
    Tab,
    Option,
} from './types';
import { makeLine } from './util';

const OPTIONS: Options = {
    width: 50,
    headerCharacter: '-',
    colors: true,
};

export const convertOption = (
    name: string,
    option: Option,
    _: Required<Options>,
): string => {
    return `Set ${name} to ${option.value}\n`;
};

export const convertTab = (
    name: string,
    tab: Tab,
    options: Required<Options>,
): string => {
    let result = name + '\n';
    for (const [name, option] of Object.entries(tab.options)) {
        result += convertOption(name, option, options);
    }
    return result + '\n';
};

export const convertApplication = (
    name: string,
    application: Application,
    options: Required<Options>,
): string => {
    const line = makeLine(options.headerCharacter, options.width);
    let result = `${line}\n${name}\n${line}\n`;
    for (const [name, tab] of Object.entries(application.tabs)) {
        result += convertTab(name, tab, options);
    }
    return result + '\n';
};

export const convert = (
    settings: MacOSSettingsInstructions,
    options: Options,
): string => {
    let result = '';
    for (const [name, application] of Object.entries(settings.applications)) {
        result += convertApplication(name, application, options);
    }
    return result + '\n';
};

export const getSettingsInstructions = (): string => {
    return convert(
        JSON.parse(readFileSync('config/settings.json', 'utf-8')),
        OPTIONS,
    );
};
