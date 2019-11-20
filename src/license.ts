import * as vscode from 'vscode';
import { JsonDecoder } from 'ts.data.json';
import 'licenses.json.ts';

export class License {
    name: string;
    header: string[];
    body: string[];
    description: string;
    completion: string;

    constructor(name: string, header: string[], body: string[], description: string, completion: string) {
        this.name = name;
        this.header = header;
        this.body = body;
        this.description = description;
        this.completion = completion;
    }
}

const licenseDecoder = JsonDecoder.object<License>(
    {
        name: JsonDecoder.string,
        header: JsonDecoder.array(JsonDecoder.string, 'string[]'),
        body: JsonDecoder.array(JsonDecoder.string, 'string[]'),
        description: JsonDecoder.string,
        completion: JsonDecoder.string
    },
    'License'
);

/**
 * Finds a license by its name
 * @param name The name to search for
 * @returns A `License` populated from the data that was found, or a `License` whose name is "NA" if none was
 */
export function licenseByName(name: string): License {
    var license: License = new License("NA", [], [], "", "");
    licensesFromJson().forEach(element => {
        if (element.name == name) {
            licenseDecoder.decodePromise(element).then(value => {
                license = value;
            });
        }
    });
    return license;
}

function licensesFromJson(): License[] {
    var ret: License[] = new Array<License>();
    licenses.forEach(element => {
        licenseDecoder.decodePromise(element)
            .then(value => {
                ret.push(value);
            })
            .catch(error=> {
                console.log(error);;
            });;
    });
    return ret;
}