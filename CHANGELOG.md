# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project (loosely 😅) adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
## [2.0.0] - 11/19/2019
### Added
- Migrate to actual extension to support dynamic license snippets via a workspace config
- Helper script for adding license support
### Changed
- Change name to License Helper

## [1.0.1] - 06/02/2019
### Added
- Includes the LICENSE file in root of project
### Changed
- Adds relevant information to package.json for relase

## [1.0.0] - 06/02/2019
### Added
- Package and release
### Changed
- Refactor snippet prefixes to match SPDX identifiers

## [0.2.0~beta] - 06/02/2019
### Added
- Created snippets for the LGPL-3.0-or-later license and its notice
- Created snippets for the AGPL-3.0-or-later license and its notice
- Created snippet for the BSD-3-Clause license (no header/notice)
- Created snippet for the BSD-2-Clause license (no header/notice)
- Created snippet for the CDDL-1.0 license (no header/notice)
- Created snippet for the EPL-1.0 license (no header/notice)
### Changed
- Improved formatting of *GPL notices
- Ignore duplicate header markdownlint rule
- Alphabetize the snippets
### Removed
- Removed the singlefile GPL notice

## [0.1.0~beta] - 06/01/2019
### Added
- Created snippet for Apache-2.0 license
- Created snippet for Apache-2.0 notice
- Created snippet for GPL-3.0-or-later license
- Created snippet for GPL-3.0-or-later multifile notice
- Created snippet for GPL-3.0-or-later singlefile notice
- Created snippet for MIT license
- Created snippet for MPL-v2.0 license
- Created snippet for MPL-v2.0 notice
- Created snippet for Unlicense "license"
- Created snippet for Unlicense notice
- Created project-level snippets file
### Changed
- Make default project name $WORKSPACE_NAME
- Ignore blanks around lists markdownlint rule
- Ignore blanks around headings markdownlint rule
- Improved snippet descriptions by including proper license titles
