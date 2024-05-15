#!/bin/bash

PROJECT=pkgconf

if ! is_cmd $PROJECT; then
	clone_third_party_github $PROJECT $PROJECT

	safe_pushd "$THIRD_PARTY/$PROJECT"

	git checkout $PROJECT-2.2.0

	if [ ! -f configure ]; then
		./autogen.sh
	fi

	./configure
	make -j

	sudo_cmd make install
	sudo_cmd ldconfig

	safe_popd
fi

if ! is_cmd pkg-config; then
	ln -s "$(which $PROJECT)" "$INSTALL_PREFIX/bin/pkg-config"
fi
