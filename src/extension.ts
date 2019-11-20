import * as vscode from 'vscode';
import { License, licenseByName } from './license';
import { type } from 'os';

export function activate(context: vscode.ExtensionContext) {
	let firstLaunch = vscode.commands.registerCommand('license_helper.firstLaunch', () => {
		vscode.window.showInformationMessage('Welcome to License Helper! Would you like to configure some default values?', ...['Yes!', 'No, thanks!'])
			.then(selection => {
				switch (selection) {
					case "Yes!":
						// Open the settings screen
						break;
					case "No, thanks!":
						// Do nothing
						break;
				}
			})
	});

	let initForProject = vscode.commands.registerCommand('license_helper.initForProject', () => {
		var openFolders = vscode.workspace.workspaceFolders!;
		var config = vscode.workspace.getConfiguration('licenseHelper');
		var license: License;
		var licenseExists = false;

		if (config != undefined) {
			license = licenseByName(config.get('license') as string);
			if (license.name != "NA") {
				openFolders.forEach(folder => {
					vscode.workspace.fs.readDirectory(folder.uri)
						.then(value => { value.forEach(dirent => {
							// Check for license file
							if (dirent[0] == "LICENSE" || dirent[0] == "COPYING") {
								licenseExists = true;
							} else {
								//TODO: Make a new LICENSE file
							}
						});});
				});
			}
		}
	});

	context.subscriptions.push(firstLaunch, initForProject);
}

export function deactivate() {}
