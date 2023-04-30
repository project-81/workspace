PROJECT=fzf

if is_cmd $PROJECT; then
	return
fi

run_install_if_not go
go version

# Check if the plugin manager already cloned the repository. If so, we can
# link it here instead of cloning it.
if [ -d "$VIM_PLUG/$PROJECT" ] && [ ! -L "$THIRD_PARTY/$PROJECT" ]; then
	ln -s "$VIM_PLUG/$PROJECT" "$THIRD_PARTY/$PROJECT"
else
	clone_third_party_github junegunn $PROJECT
fi

safe_pushd "$THIRD_PARTY/$PROJECT"

make
make install

for ENTRY in ./bin/*; do
	BASE=$(basename "$ENTRY")
	if [ ! -L "$INSTALL_PREFIX/bin/$BASE" ]; then
		ln -s "$THIRD_PARTY/$PROJECT/bin/$BASE" \
			"$INSTALL_PREFIX/bin/$BASE"
	fi
done

manual_install_vim_plugin $PROJECT

safe_popd
