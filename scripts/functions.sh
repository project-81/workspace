#!/bin/bash

in_path() {
	[[ ":$PATH:" == *":$1:"* ]]
}

add_if_not() {
	if ! in_path "$1"; then
		if [ -d "$1" ]; then
			export PATH="$1:$PATH"
		fi
	fi
}

if [ "$SCRIPTS" ] && [ -d "$SCRIPTS" ] && [ ! -L "$HOME/bin/functions.sh" ]; then
	mkdir -p "$HOME/bin"
	ln -s "$SCRIPTS/functions.sh" "$HOME/bin/functions.sh"
	add_if_not "$HOME/bin"
fi

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

is_zsh() {
	[ "$(basename "$(readlink /proc/$$/exe)")" = "zsh" ]
}

is_a_tty() {
	[ "$(tty)" != "not a tty" ]
}

export LOADED_FUNCTIONS=1
