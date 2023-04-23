#!/bin/bash

PROJECT=openocd

clone_third_party_github raspberrypi $PROJECT

safe_pushd "$THIRD_PARTY/$PROJECT"

git checkout rp2040
git pull

./bootstrap
if is_rpi; then
	./configure --enable-sysfsgpio --enable-bcm2835gpio
else
	./configure
fi
make "-j$(nproc)"
sudo make install

safe_popd
