#!/bin/bash

PROJECT=picotool

pushd "$THIRD_PARTY/$PROJECT" >/dev/null || exit

if [ ! -L ~/bin/$PROJECT ]; then
	mkdir -p build
	pushd build >/dev/null || exit

	cmake ..
	make "-j$(nproc)"
	ln -s "$(realpath $PROJECT)" ~/bin/$PROJECT

	popd >/dev/null || exit
fi

UDEV_FILE=99-$PROJECT.rules

UDEV_DEST=/usr/lib/udev/rules.d

# Install the udev rule.
if [ ! -L $UDEV_DEST/$UDEV_FILE ]; then
	sudo ln -s "$(realpath udev/$UDEV_FILE)" $UDEV_DEST/$UDEV_FILE
	sudo udevadm control --reload-rules && sudo udevadm trigger
fi

popd >/dev/null || exit

picotool version
