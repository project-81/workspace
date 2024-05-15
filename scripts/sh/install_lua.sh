#!/bin/bash

PROJECT=lua
export LUA_VERSION=5.4
LUA_RELEASE=6

LUA_VER=$PROJECT-$LUA_VERSION
LUA_SLUG=$LUA_VER.$LUA_RELEASE

# What does any of this do?
# export LUA_DIR=/usr/local/lib/$PROJECT/$LUA_VERSION
# export LUA_CPATH="?.so;$LUA_DIR/?.so"
# export LUA_PATH="?.$PROJECT;$LUA_DIR/?.$PROJECT"

PKG_CONF_DIR=/usr/local/lib/pkgconfig

if [ ! -f $PKG_CONF_DIR/$LUA_VER.pc ]; then
	safe_pushd "$THIRD_PARTY"

	if [ ! -d $LUA_SLUG ]; then
		curl -L -R -O https://www.$PROJECT.org/ftp/$LUA_SLUG.tar.gz
		tar zxf $LUA_SLUG.tar.gz
		rm $LUA_SLUG.tar.gz
	fi

	safe_pushd $LUA_SLUG

	make -j all
	make test
	sudo_cmd make install

	safe_popd

	safe_popd

	# Copy custom pkgconf file.
	sudo_cmd mkdir -p $PKG_CONF_DIR
	sudo_cmd cp "$REPO/data/$LUA_VER.pc" $PKG_CONF_DIR
fi
