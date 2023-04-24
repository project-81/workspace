#!/bin/bash

is_cmd() {
	type "$1" >/dev/null 2>&1
}

sudo_cmd() {
	if [ -f ~/password.txt ]; then
		local PASS
		PASS=$(cat ~/password.txt)
		echo "$PASS" | sudo -S "$@"
	else
		sudo "$@"
	fi

}

safe_pushd() {
	mkdir -p "$1"
	pushd "$1" >/dev/null || exit
}

safe_popd() {
	popd >/dev/null || exit
}

. "$SCRIPTS/platform_functions.sh"
. "$SCRIPTS/install_functions.sh"
. "$SCRIPTS/git_functions.sh"
. "$SCRIPTS/networking_functions.sh"
