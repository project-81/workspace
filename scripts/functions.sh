#!/bin/bash

in_path() {
	[[ ":$PATH:" == *":$1:"* ]]
}

# Run 'export DEBUG=1' for debug logging.
[ "$DEBUG" ] || DEBUG=0
dbg() {
	if [ ! $DEBUG -eq 0 ]; then
		"$@"
	fi

}

add_end_if_not() {
	if ! in_path "$1"; then
		if [ -d "$1" ]; then
			export PATH="$PATH:$1"
			dbg echo "Added '$1' to back of path."
		fi
	fi
}

add_front_if_not() {
	if ! in_path "$1"; then
		if [ -d "$1" ]; then
			export PATH="$1:$PATH"
			dbg echo "Added '$1' to front of path."
		fi
	fi
}

add_if_not() {
	add_end_if_not "$@"
}

mkdir -p "$HOME/bin"
mkdir -p "$INSTALL_PREFIX/bin"

add_user_paths() {
	add_front_if_not "$HOME/bin"
	add_front_if_not "$INSTALL_PREFIX/bin"
}

if [ "$SCRIPTS" ] && [ -d "$SCRIPTS" ] && [ ! -L "$HOME/bin/functions.sh" ]; then
	ln -s "$SCRIPTS/functions.sh" "$HOME/bin/functions.sh"
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
