run_install_if_not go
go version

PROJECT=fzf

if is_cmd $PROJECT; then
	return
fi

# Check if the plugin manager already cloned the repository. If so, we can
# link it here instead of cloning it.
if [ -d "$VIM_PLUG/$PROJECT" ] && [ ! -L "$THIRD_PARTY/$PROJECT" ]; then
	ln -s "$VIM_PLUG/$PROJECT" "$THIRD_PARTY/$PROJECT"
else
	clone_third_party_github junegunn $PROJECT
fi

safe_pushd "$THIRD_PARTY/$PROJECT"

install_package_if_not make

# Specify a version because we're not checking out any specific tag.
make FZF_VERSION="custom"
make install FZF_VERSION="custom"

for ENTRY in ./bin/*; do
	install_local_bin "$PROJECT/$ENTRY"
done

manual_install_vim_plugin $PROJECT

safe_popd
