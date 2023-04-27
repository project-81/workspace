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

is_wsl() {
	[[ $(uname -r) == *"microsoft"* ]]
}

is_rpi() {
	[ "$(uname -n)" = "raspberrypi" ] \
		|| is_raspbian \
		|| [[ $(uname -n) == "rpi"* ]]
}
