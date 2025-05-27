install_package_if_not curl

if ! is_cmd cargo; then
	# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path -y
fi

add_if_not "$HOME/.cargo/bin"
