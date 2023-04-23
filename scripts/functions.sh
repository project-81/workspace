#!/bin/bash

read_os_release() {
	grep -oP "(?<=^$1=).+" /etc/os-release | tr -d '"'
}

os_id() {
	read_os_release ID
}

is_opensuse() {
	[ "$(os_id)" = "opensuse-tumbleweed" ]
}

is_debian() {
	[ "$(os_id)" = "debian" ]
}

assert_opensuse() {
	if ! is_opensuse; then
		echo "Expected 'opensuse-tumbleweed' but got '$(os_id)'."
		exit 1
	fi
}

run_install() {
	# shellcheck disable=SC1090
	. "$REPO/scripts/sh/install_$1.sh"
}

install_package() {
	if is_opensuse; then
		sudo zypper install -y "$1"
	elif is_debian; then
		sudo apt-get install -yu "$1"
	fi
}

is_wsl() {
	[[ $(uname -r) == *"microsoft"* ]]
}

is_rpi() {
	[ "$(uname -n)" = "raspberrypi" ]
}

THIRD_PARTY=$HOME/third-party

clone_third_party_ssh() {
	mkdir -p "$THIRD_PARTY"
	pushd "$THIRD_PARTY" >/dev/null || exit

	if [ ! -d "$2" ]; then
		git clone "$3@$4:$1/$2.git"
		echo "Cloned '$1/$2'."
	else
		echo "Not cloning '$1/$2', already present."
	fi

	# Update the repository while we're here.
	pushd "$2" >/dev/null || exit
	git pull --prune
	git submodule update --init
	popd >/dev/null || exit

	popd >/dev/null || exit
}

clone_third_party_github() {
	clone_third_party_ssh "$1" "$2" git github.com
}

safe_pushd() {
	mkdir -p "$1"
	pushd "$1" >/dev/null || exit
}

safe_popd() {
	popd >/dev/null || exit
}

poke_ssh() {
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
}

install_udev_rule() {
	local DEST
	DEST="$UDEV_DEST/$(basename "$1")"

	if [ ! -L "$DEST" ]; then
		sudo ln -s "$(realpath "$1")" "$DEST"
		sudo udevadm control --reload-rules && sudo udevadm trigger
		echo "Installed udev rule '$DEST'."
	fi
}
