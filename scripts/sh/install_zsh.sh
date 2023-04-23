install_package zsh
clone_third_party_github ohmyzsh ohmyzsh

if ! [[ "$SHELL" == *"zsh" ]]; then
	chsh -s "$(which zsh)"
fi

if is_opensuse; then
	# Install ShellCheck.
	PACKAGES+=(ShellCheck)
else
	PACKAGES+=(shellcheck)
fi
