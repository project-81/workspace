if is_cmd nvim; then
	return
fi

if ! is_cmd cmake; then
	if is_opensuse; then
		install_package cmake-full
	fi
fi

if ! is_cmd msgmerge; then
	if is_opensuse; then
		install_package gettext-tools
	else
		install_package gettext
	fi
fi

PROJECT=neovim
VERSION=0.9

clone_third_party_github_shallow $PROJECT $PROJECT "--branch=release-$VERSION"
safe_pushd "$THIRD_PARTY/$PROJECT"

export CMAKE_BUILD_TYPE=Release

# Build dependencies.
mkdir -p .deps
safe_pushd .deps
cmake ../cmake.deps
make "-j$(nproc)"
safe_popd

make "-j$(nproc)"

sudo make install

unset CMAKE_BUILD_TYPE

safe_popd
