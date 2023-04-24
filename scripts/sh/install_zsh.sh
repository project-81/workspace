install_package zsh
clone_third_party_github ohmyzsh ohmyzsh

if ! [[ "$SHELL" == *"zsh" ]]; then
	# Use 'sudo' because chsh will prompt a password regardless.
	sudo_cmd chsh -s "$(which zsh)" "$(whoami)"
fi

if is_opensuse; then
	# Install ShellCheck.
	PACKAGES+=(ShellCheck)
else
	PACKAGES+=(shellcheck)
fi
