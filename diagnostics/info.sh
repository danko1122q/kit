#!/usr/bin/env bash
_modules=('system' 'kit' 'kit_config' 'kit_wrapper' 'kit_wrapper_function' 'tool')
_modules_consented=()

set -o pipefail

export LC_ALL=C
export LANG=C

KIT="kit"
if ! command -v kit &>/dev/null; then
	if command -v kitcat &> /dev/null; then
		KIT="kitcat"
	else
		tput setaf 1
		printf "%s\n%s\n" \
			"Unable to find a kit executable on your PATH." \
			"Please ensure that 'kit' exists and is not named something else."
		tput sgr0
		exit 1
	fi
fi

# -----------------------------------------------------------------------------
# Modules:
# -----------------------------------------------------------------------------

_kit_:description() {
	_collects "Version information for 'kit'."
	_collects "Custom syntaxes and themes for 'kit'."
}

_kit_config_:description() {
	_collects "The environment variables used by 'kit'."
	_collects "The 'kit' configuration file."
}

_kit_wrapper_:description() {
	_collects "Any wrapper script used by 'kit'."
}

_kit_wrapper_function_:description() {
	_collects "The wrapper function surrounding 'kit' (if applicable)."
}

_system_:description() {
	_collects "Operating system name."
	_collects "Operating system version."
}

_tool_:description() {
	_collects "Version information for 'less'."
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

_kit_:run() {
	_out "$KIT" --version
	_out env | grep '^KIT_\|^PAGER='

	local cache_dir
	cache_dir="$($KIT --cache-dir)"
	if [[ -f "${cache_dir}/syntaxes.bin" ]]; then
		_print_command "$KIT" "--list-languages"
		echo "Found custom syntax set."
	fi

	if [[ -f "${cache_dir}/themes.bin" ]]; then
		_print_command "$KIT" "--list-themes"
		echo "Found custom theme set."
	fi
}

_kit_config_:run() {
	if [[ -f "$("$KIT" --config-file)" ]]; then
		_out_fence cat "$("$KIT" --config-file)"
	fi
}

_kit_wrapper_:run() {
	_kit_wrapper_:detect_wrapper() {
		local kit="$1"
		if file "$(command -v "${kit}")" | grep "text executable" &> /dev/null; then
			_out_fence cat "$(command -v "${kit}")"
			return
		fi

		printf "\nNo wrapper script for '%s'.\n" "${kit}"
	}

	_kit_wrapper_:detect_wrapper kit
	if [[ "$KIT" != "kit" ]]; then
		_kit_wrapper_:detect_wrapper "$KIT"
	fi
}

_kit_wrapper_function_:run() {
	_kit_wrapper_function_:detect_wrapper() {
		local command="$1"
		case "$("$SHELL" --version | head -n 1)" in
			*fish*)
				if "$SHELL" --login -i -c "type ${command}" 2>&1 | grep 'function' &> /dev/null; then
					_out_fence "$SHELL" --login -i -c "functions ${command}"
					return
				fi ;;

			*bash* | *zsh*)
				local type
				type="$("$SHELL" --login -i -c "type ${command}" 2>&1)"
				if grep 'function' <<< "$type" &> /dev/null; then
					_out_fence "$SHELL" --login -i -c "declare -f ${command}"
					return
				elif grep 'alias' <<< "$type" &> /dev/null; then
					_out_fence "$SHELL" --login -i -c "type ${command}"
					return
				fi ;;

			*)
				echo "Unable to determine if a wrapper function for '${command}' is set."
				return ;;
		esac
		printf "\nNo wrapper function for '%s'.\n" "${command}"
	}

	_kit_wrapper_function_:detect_wrapper kit
	_kit_wrapper_function_:detect_wrapper cat
	if [[ "$KIT" != "kit" ]]; then
		_kit_wrapper_function_:detect_wrapper "$KIT"
	fi
}

_system_:run() {
	_out uname -srm

	if command -v "sw_vers" &> /dev/null; then _out sw_vers; fi
	if command -v "lsb_release" &> /dev/null; then _out lsb_release -a; fi
}

_tool_:run() {
	_out less --version | head -n1
}

# -----------------------------------------------------------------------------
# Functions:
# -----------------------------------------------------------------------------

_print_command() {
	printf '\n**$' 1>&2
	printf ' %s' "$@" 1>&2
	printf '**\n' 1>&2
}

_out() {
	_print_command "$@"
	"$@" 2>&1 | sed 's/$/  /'
}

_out_fence() {
	_print_command "$@"
	printf '```\n' 1>&2
	"$@" 2>&1
	printf '```\n' 1>&2
}

_tput() {
	tput "$@" 1>&2 2> /dev/null
}

_collects() {
	printf " - %s\n" "$1" 1>&2
}

_ask_module() {
	_tput clear
	_tput cup 0 0

	cat 1>&2 << EOF
--------------------------------------------------------------------------------
This script runs some harmless commands to collect information about your
system and kit configuration. It will give you a small preview of the commands
that will be run, and ask consent before running them. Once completed, it will
output a small report that you can review and copy into the issue description.
--------------------------------------------------------------------------------
EOF

	# Print description.
	_tput setaf 3
	printf "The following data will be collected:\n" 1>&2
	_tput sgr0
	"_$1_:description"
	_tput sgr0

	# Print preview.
	_tput setaf 3
	printf "\nThe following commands will be run:\n" 1>&2
	_tput sgr0
	declare -f "_$1_:run" \
		| sed 's/^ *//; s/;$//' \
		| grep '^_out[^ ]* ' \
		| sed 's/^_out[^ ]* //' \
		| sed "s/\"\$KIT\"/$KIT/" 1>&2

	# Prompt
	printf "\n" 1>&2
	local response
	while true; do
		_tput cup "$(($( tput lines || echo 22) - 2))"
		_tput el
		read -er -p "Collect $(sed 's/_/ /' <<< "$1") data? [Y/n] " response
		case "$response" in
			Y | y | yes | '') return 0 ;;
			N | n | no) return 1 ;;
			*) continue ;;
		esac
	done
}

_run_module() {
	local module="$1"
	printf "%s\n%s\n" "$module" "$(printf "%${#module}s" | tr ' ' '-')"
	"_$1_:run"
}

# -----------------------------------------------------------------------------
# Functions:
# -----------------------------------------------------------------------------

# Tell the user if their executable isn't named "kit".
if [[ "$KIT" != "kit" ]] && [[ "$1" != '-y' ]]; then
	trap '_tput rmcup; exit 1' INT
	_tput smcup
	_tput clear
	_tput cup 0 0
	_tput setaf 1
	printf "The %s executable on your system is named '%s'.\n%s\n" "kit" "$KIT" \
		"If your issue is related to installation, please check that this isn't the issue."
	_tput sgr0
	printf "Press any key to continue...\n"
	read -rsn1
	_tput rmcup
fi

# Ask for consent.
if [[ "$1" == '-y' ]]; then
	_modules_consented=("${_modules[@]}")
else
	trap '_tput rmcup; exit 1' INT
	_tput smcup
	for _module in "${_modules[@]}"; do
		if _ask_module "$_module"; then
			_modules_consented+=("$_module")
		fi
	done
	_tput rmcup
fi

# Collect information.
for _module in "${_modules_consented[@]}"; do
	_run_module "$_module" 2>&1
	printf "\n"
done
