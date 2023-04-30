#!/bin/bash

time_if() {
	if { time test 1 ; } >/dev/null 2>&1; then
		time "$@"
		echo "Timed command: '$*'."
	else
		"$@"
	fi
}

run_install() {
	echo "Starting install script for '$1'."
	time_if . "$REPO/scripts/sh/install_$1.sh"
	echo "Install script for '$1' completed."
}

run_install_if_not() {
	if ! is_cmd "$1"; then
		run_install "$1"
	fi
}

run_src_install() {
	run_install "$1-src"
}

install_package() {
	if is_opensuse; then
		time_if sudo_cmd zypper install -y "$@"
	elif is_debian || is_ubuntu; then
		time_if sudo_cmd apt-get install -yu "$@"
	fi
}

install_udev_rule() {
	local DEST
	DEST="$UDEV_DEST/$(basename "$1")"

	if [ ! -L "$DEST" ]; then
		sudo_cmd ln -s "$(realpath "$1")" "$DEST"
		sudo_cmd udevadm control --reload-rules \
			&& sudo_cmd udevadm trigger
		echo "Installed udev rule '$DEST'."
	fi
}

install_vim_autoload() {
	safe_pushd "$VIM_AUTOLOAD"

	if ! [ -L "$(basename "$1")" ]; then
		ln -s "$1" .
	fi

	safe_popd
}

install_third_party_link() {
	safe_pushd "$1"
	local BASE
	BASE="$(basename "$2")"
	if [ ! -L "$BASE" ] && [ ! -d "$BASE" ]; then
		ln -s "$THIRD_PARTY/$2" .
	fi
	safe_popd
}

manual_install_vim_plugin() {
	install_third_party_link "$VIM_PLUG" "$1"
}

install_local_bin() {
	install_third_party_link "$INSTALL_PREFIX/bin" "$1"
}

pip_install() {
	local PIP
	PIP=$(which pip)
	if [[ $PIP == *"venv"* ]]; then
		time_if pip install "$@"
	else
		time_if pip install --user "$@" \
			|| time_if "$VENV/bin/pip" install "$@"
	fi
}
