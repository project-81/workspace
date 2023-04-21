read_os_release() {
	grep -oP "(?<=^$1=).+" /etc/os-release | tr -d '"'
}

os_id() {
	read_os_release ID
}

assert_opensuse() {
	local OS_ID
	OS_ID=$(os_id)
	if ! [ "$OS_ID" = "opensuse-tumbleweed" ]; then
		echo "Expected 'opensuse-tumbleweed' but got '$OS_ID'."
		exit 1
	fi
}

run_install() {
	# shellcheck disable=SC1090
	. "$REPO/scripts/sh/install_$1.sh"
}

install_package() {
	sudo zypper install -y "$1"
}

is_wsl() {
	[[ $(uname -r) == *"microsoft"* ]]
}
