#!/bin/bash

if is_rpi || is_ubuntu; then
	# 32-bit Raspbian doesn't support squashfs. It seems like only the Pi 4
	# supports it.

	# https://raspberrypi.stackexchange.com/a/119934
	# sudo apt install snapd -y || true
	# sudo snap install --classic nvim || true

	# Build from source instead.
	run_src_install neovim
else
	install_package neovim
fi

clone_third_party_github junegunn vim-plug

# Ensure that neovim config directory exists.
mkdir -p "$HOME/.config/nvim"

# Ensure that neovim is using the same 'autoload' directory.
if [ ! -L "$HOME/.config/nvim/autoload" ]; then
	ln -s "$VIM_AUTOLOAD" "$HOME/.config/nvim/autoload"
fi

install_vim_autoload "$THIRD_PARTY/vim-plug/plug.vim"

# Install (and update) plugins.
if is_a_tty; then
	if is_cmd nvim; then
		nvim +'PlugInstall --sync' +qa
		nvim +'PlugUpdate --sync' +qa
	elif [ -f "$INSTALL_PREFIX/bin/nvim" ]; then
		"$INSTALL_PREFIX/bin/nvim" +'PlugInstall --sync' +qa
		"$INSTALL_PREFIX/bin/nvim" +'PlugUpdate --sync' +qa
	fi
fi
