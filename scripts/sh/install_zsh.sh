install_package zsh
clone_third_party_github ohmyzsh ohmyzsh

if ! [[ "$SHELL" == *"zsh" ]]; then
	chsh -s $(which zsh)
fi

# Install ShellCheck.
install_package ShellCheck
