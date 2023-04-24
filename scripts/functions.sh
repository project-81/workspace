#!/bin/bash

is_cmd() {
	type "$1" >/dev/null 2>&1
}

sudo_cmd() {
	if [ -f ~/password.txt ]; then
		local pass
		pass=$(cat ~/password.txt)
		echo "$pass" | sudo -S "$@"
	else
		sudo "$@"
	fi

}

safe_pushd() {
	mkdir -p "$1"
	pushd "$1" >/dev/null || exit 1
}

safe_popd() {
	popd >/dev/null || exit 1
}

. "$SCRIPTS/platform_functions.sh"
. "$SCRIPTS/install_functions.sh"
. "$SCRIPTS/git_functions.sh"
. "$SCRIPTS/networking_functions.sh"
