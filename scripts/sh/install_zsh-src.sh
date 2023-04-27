PROJECT=zsh
VERSION=5.9

if ! is_cmd autoconf; then
	if is_opensuse; then
		install_package autoconf
	fi
fi

clone_third_party_github_shallow $PROJECT-users $PROJECT "--branch=$VERSION"
safe_pushd "$THIRD_PARTY/$PROJECT"

if [ ! -f configure ]; then
	autoupdate
	./Util/preconfig
fi

./configure "$PREFIX_ARG" \
	--enable-multibyte \
	--enable-cap \
	--enable-gdbm \
	--enable-pcre \
	--with-tcsetpgrp
make "-j$(nproc)"
make check

make install.bin
make install.modules
make install.fns

safe_popd