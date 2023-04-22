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

THIRD_PARTY=$HOME/third-party

clone_third_party_ssh() {
	mkdir -p "$THIRD_PARTY"
	pushd "$THIRD_PARTY" >/dev/null

	if [ ! -d "$2" ]; then
		git clone "$3@$4:$1/$2.git"
		echo "Cloned '$1/$2'."
	else
		echo "Not cloning '$1/$2', already present."
	fi

	# Update the repository while we're here.
	pushd "$2" >/dev/null
	git pull --prune
	popd >/dev/null

	popd >/dev/null
}

clone_third_party_github() {
	clone_third_party_ssh "$1" "$2" git github.com
}
