#!/bin/bash

time_if() {
	if time test; then
		time "$@"
	else
		"$@"
	fi
}

run_install() {
	echo "Starting install script for '$1'."
	time_if . "$REPO/scripts/sh/install_$1.sh"
	echo "Install script for '$1' completed."
}

run_src_install() {
	run_install "$1-src"
}

install_package() {
	if is_opensuse; then
		time_if sudo_cmd zypper install -y "$@"
	elif is_debian; then
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
