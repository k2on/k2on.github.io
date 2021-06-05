import { Options } from './types';

export const makeLine = (character: string, width: number): string =>
    Array(width + 1).join(character);
