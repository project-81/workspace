#!/bin/bash

PROJECT=picotool

# Ensure PICO_SDK_PATH is set (and is present).
[ "$PICO_SDK_PATH" ] || export PICO_SDK_PATH="$THIRD_PARTY/pico-sdk"
test -d "$PICO_SDK_PATH"

pushd "$THIRD_PARTY/$PROJECT" >/dev/null || exit

if [ ! -L ~/bin/$PROJECT ]; then
	mkdir -p build
	pushd build >/dev/null || exit

	cmake ..
	make "-j$(nproc)"
	ln -s "$(realpath $PROJECT)" ~/bin/$PROJECT

	popd >/dev/null || exit
fi

# Install the udev rule.
install_udev_rule udev/99-$PROJECT.rules

popd >/dev/null || exit

picotool version
