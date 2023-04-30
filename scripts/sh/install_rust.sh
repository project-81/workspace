install_package_if_not curl

if ! is_cmd cargo; then
	curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path -y
fi

add_if_not "$HOME/.cargo/bin"
