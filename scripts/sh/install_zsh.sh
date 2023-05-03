if ! is_cmd zsh; then
	install_package zsh
fi

clone_third_party_github_shallow ohmyzsh ohmyzsh --branch=master

if ! [[ "$SHELL" == *"zsh" ]]; then
	# Use 'sudo' because chsh will prompt a password regardless.
	# This can also fail if some more sophisticated user management
	# technology is used (like LDAP, or something else).
	#
	# In those cases, don't fail to bootstrap if this doesn't work.
	sudo_cmd chsh -s "$(which zsh)" "$(whoami)" || true
fi

clone_third_party_github_shallow zsh-users zsh-syntax-highlighting \
	--branch=master
