#!/bin/bash

read_os_release() {
	grep -oP "(?<=^$1=).+" /etc/os-release | tr -d '"'
}

os_id() {
	read_os_release ID
}

os_id_is() {
	[ "$(os_id)" = "$1" ]
}

is_opensuse() {
	os_id_is "opensuse-tumbleweed"
}

is_raspbian() {
	os_id_is "raspbian"
}

is_debian() {
	# Include 'raspbian' in this check for now, too.
	os_id_is "debian" || is_raspbian
}

assert_opensuse() {
	if ! is_opensuse; then
		echo "Expected 'opensuse-tumbleweed' but got '$(os_id)'."
		exit 1
	fi
}

run_install() {
	echo "Starting install script for '$1'."

	# shellcheck disable=SC1090
	. "$REPO/scripts/sh/install_$1.sh"

	echo "Install script for '$1' completed."
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
	[ "$(uname -n)" = "raspberrypi" ] || is_raspbian
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

attempt_ping() {
	ping -c 1 "$1" >/dev/null
}

await_pingable() {
	local PING_COUNT
	PING_COUNT=0
	while ! attempt_ping "$1"; do
		echo "Ping attempt '$1' $PING_COUNT."
		((PING_COUNT++)) || true
	done

	echo "'$1' responded to ping."
}

ipv4_addr() {
	getent ahostsv4 "$1" | sed -n 's/ *STREAM.*//p'
}

is_cmd() {
	type "$1" >/dev/null
}
