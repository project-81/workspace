#!/bin/bash

PROJECT=openocd

# Return early if it's already installed.
if is_cmd $PROJECT; then
	return
fi

# Install system dependencies.
if is_debian || is_ubuntu; then
	install_package automake autoconf texinfo libtool libftdi-dev
fi

clone_third_party_github_shallow raspberrypi $PROJECT --branch=rp2040

safe_pushd "$THIRD_PARTY/$PROJECT"

./bootstrap
if is_rpi; then
	./configure --enable-sysfsgpio --enable-bcm2835gpio
else
	./configure
fi
run_make
sudo_cmd make install

safe_popd
