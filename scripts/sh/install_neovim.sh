if is_rpi; then
	# 32-bit Raspbian doesn't support squashfs.
	if ! is_raspbian; then
		# https://raspberrypi.stackexchange.com/a/119934
		sudo apt install snapd -y
		sudo snap install --classic nvim
	fi
else
	install_package neovim
fi

clone_third_party_github junegunn vim-plug

# Create the 'autoload' directory if necessary.
VIM_AUTOLOAD="$HOME/.vim/autoload"
mkdir -p "$VIM_AUTOLOAD"

# Ensure that neovim config directory exists.
mkdir -p "$HOME/.config/nvim"

# Ensure that neovim is using the same 'autoload' directory.
if [ ! -L "$HOME/.config/nvim/autoload" ]; then
	ln -s "$VIM_AUTOLOAD" "$HOME/.config/nvim/autoload"
fi

pushd "$VIM_AUTOLOAD" >/dev/null || exit

if ! [ -L plug.vim ]; then
	ln -s "$THIRD_PARTY/vim-plug/plug.vim" .
fi

popd >/dev/null || exit
