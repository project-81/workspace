install_package neovim

clone_third_party_github junegunn vim-plug

# Create the 'autoload' directory if necessary.
VIM_AUTOLOAD="$HOME/.vim/autoload"
mkdir -p "$VIM_AUTOLOAD"

# Ensure that neovim is using the same 'autoload' directory.
if [ ! -L "$HOME/.config/nvim/autoload" ]; then
	ln -s "$VIM_AUTOLOAD" "$HOME/.config/nvim/autoload"
fi

pushd "$VIM_AUTOLOAD" >/dev/null

if ! [ -L plug.vim ]; then
	ln -s "$THIRD_PARTY/vim-plug/plug.vim" .
fi

popd >/dev/null
