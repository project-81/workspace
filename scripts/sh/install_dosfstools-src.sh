if is_local_bin mkfs.fat; then
	return
fi

PROJECT=dosfstools

clone_third_party_github_shallow $PROJECT $PROJECT --branch=v4.2
safe_pushd "$THIRD_PARTY/$PROJECT"

if [ ! -f configure ]; then
	./autogen.sh
fi

./configure "$PREFIX_ARG"
make check
make "-j$(nproc)"
make install

safe_popd
