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
