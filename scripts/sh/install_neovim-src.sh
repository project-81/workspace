if is_cmd nvim; then
	return
fi

if ! is_cmd cmake; then
	if is_opensuse; then
		install_package cmake-full
	else
		install_package cmake
	fi
fi

if ! is_cmd msgmerge; then
	if is_opensuse; then
		install_package gettext-tools
	else
		install_package gettext
	fi
fi

if ! is_cmd unzip; then
	install_package unzip
fi

PROJECT=neovim
VERSION=0.9

clone_third_party_github_shallow $PROJECT $PROJECT "--branch=release-$VERSION"
safe_pushd "$THIRD_PARTY/$PROJECT"

# Build dependencies. This isn't necessary?
# mkdir -p .deps
# safe_pushd .deps
# cmake ../cmake.deps
# make "-j$(nproc)"
# safe_popd

make "-j$(nproc)" \
	CMAKE_BUILD_TYPE=Release \
	CMAKE_INSTALL_PREFIX="$INSTALL_PREFIX"
make install

safe_popd
