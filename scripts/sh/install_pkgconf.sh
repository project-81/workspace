#!/bin/bash

PROJECT=pkgconf
VERSION=2.2.0

if is_ubuntu || is_rpi; then
	sudo_cmd apt-get remove -y pkgconf pkg-config
	sudo_cmd apt-get autoremove -y
fi

if ! is_cmd $PROJECT; then
	clone_third_party_github $PROJECT $PROJECT

	safe_pushd "$THIRD_PARTY/$PROJECT"

	git checkout $PROJECT-$VERSION

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
