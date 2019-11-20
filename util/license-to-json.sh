#!/bin/bash

#   
#   * This file is a part of License Helper for VSCode
#   * to-json-array.sh created by Joseph Diragi <joyod3@gmail.com> on 11/19/2019
#   * Copyright © 2019 TheNightmanCodeth. All rights reserved.
#   
#   License Helper for VSCode is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#   
#   License Helper for VSCode is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#   
#   You should have received a copy of the GNU General Public License
#   along with License Helper for VSCode.  If not, see <https://www.gnu.org/licenses/>.
#

### START OF CODE GENERATED BY Argbash v2.8.1 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info
# Generated online by https://argbash.io/generate

die()
{
	local _ret=$2
	test -n "$_ret" || _ret=1
	test "$_PRINT_HELP" = yes && print_help >&2
	echo "$1" >&2
	exit ${_ret}
}


begins_with_short_option()
{
	local first_option all_short_options='ndch'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_name="\"\""
_arg_description="\"\""
_arg_completion_term="\"\""
_arg_header_file="NULL"


print_help()
{
	printf 'Usage: %s [-n|--name <arg>] [-d|--description <arg>] [-c|--completion-term <arg>] [-h|--header-file <arg>] <license-file>\n' "$0"
	printf '\t%s\n' "-n, --name: The name of the license (no default)"
	printf '\t%s\n' "-d, --description: The description of this license (no default)"
	printf '\t%s\n' "-c, --completion-term: The term for completion (no default)"
	printf '\t%s\n' "-h, --header-file: A file containing the license notice/file header (no default)"
}


parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-n|--name)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_name="$2"
				shift
				;;
			--name=*)
				_arg_name="${_key##--name=}"
				;;
			-n*)
				_arg_name="${_key##-n}"
				;;
			-d|--description)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_description="$2"
				shift
				;;
			--description=*)
				_arg_description="${_key##--description=}"
				;;
			-d*)
				_arg_description="${_key##-d}"
				;;
			-c|--completion-term)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_completion_term="$2"
				shift
				;;
			--completion-term=*)
				_arg_completion_term="${_key##--completion-term=}"
				;;
			-c*)
				_arg_completion_term="${_key##-c}"
				;;
			-h|--header-file)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_header_file="$2"
				shift
				;;
			--header-file=*)
				_arg_header_file="${_key##--header-file=}"
				;;
			-h*)
				_arg_header_file="${_key##-h}"
				;;
			*)
				_last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
		esac
		shift
	done
}


handle_passed_args_count()
{
	local _required_args_string="'license-file'"
	test "${_positionals_count}" -ge 1 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require exactly 1 (namely: $_required_args_string), but got only ${_positionals_count}." 1
	test "${_positionals_count}" -le 1 || _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect exactly 1 (namely: $_required_args_string), but got ${_positionals_count} (the last one was: '${_last_positional}')." 1
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names="_arg_license_file "

	shift "$_shift_for"
	for _positional_name in ${_positional_names}
	do
		test $# -gt 0 || break
		eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
		shift
	done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

### END OF CODE GENERATED BY Argbash

## Get the current time to make the output filename
now=$(date +%m%H%M%S)

out_file="out-$now.json"

## Create the file to hold the json object
echo "{" >> $out_file

## Add the name field to the json object
echo -e "\t\"name\": \"${_arg_name}\"," >> $out_file

## Add the header field
echo -e "\t\"header\": [" >> $out_file

## If $_arg_header_file is not NULL, add each line
if [[ ${_arg_header_file} != "NULL" ]]; then
    ## Iterate throught the lines in the file
    while IFS= read -r line; do
        ## Print the current line to the bottom of out_file
        echo -e "\t\t\"   $line\"," >> $out_file
    done < "$_arg_header_file"
fi

echo -e "\t]," >> $out_file

## Open up the body array
echo -e "\t\"body\": [" >> $out_file

## Add the body from LICENSE/_arg_license_file
while IFS= read -r line; do
    echo -e "\t\t\"$line\"," >> $out_file
done <$_arg_license_file

## Close the body array
echo -e "\t]," >> $out_file

## Add the description value
echo -e "\t\"description\": \"$_arg_description\"," >> $out_file

## Add the completion value
echo -e "\t\"completion\": \"$_arg_completion_term\"" >> $out_file

## Close the json object
echo "}" >> $out_file