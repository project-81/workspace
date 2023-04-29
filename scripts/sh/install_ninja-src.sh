PROJECT=ninja

if is_cmd $PROJECT; then
	return
fi

if ! is_cmd c++; then
	if is_opensuse; then
		install_package gcc-c++
	fi
fi

clone_third_party_github_shallow $PROJECT-build $PROJECT "--branch=master"
safe_pushd "$THIRD_PARTY/$PROJECT"

if [ ! -f ./ninja ]; then
	# Build and install ninja.
	./configure.py --bootstrap
fi

./ninja
./ninja --version

safe_popd

if [ ! -L "$INSTALL_PREFIX/bin/$PROJECT" ]; then
	mkdir -p "$INSTALL_PREFIX/bin"
	ln -s "$THIRD_PARTY/$PROJECT/$PROJECT" "$INSTALL_PREFIX/bin/$PROJECT"
fi

if [ ! -L "$INSTALL_PREFIX/doc/$PROJECT" ]; then
	mkdir -p "$INSTALL_PREFIX/doc"
	ln -s "$THIRD_PARTY/$PROJECT/doc" "$INSTALL_PREFIX/doc/$PROJECT"
fi
