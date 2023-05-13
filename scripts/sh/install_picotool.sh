#!/bin/bash

PROJECT=picotool

# Ensure PICO_SDK_PATH is set (and is present).
[ "$PICO_SDK_PATH" ] || export PICO_SDK_PATH="$THIRD_PARTY/pico-sdk"

# Ensure repositories are checked out.
REPOS=(pico-sdk picotool)
for repo in "${REPOS[@]}"; do
	clone_third_party_github raspberrypi "$repo"
done

test -d "$PICO_SDK_PATH"
test -d "$THIRD_PARTY/$PROJECT"

pushd "$THIRD_PARTY/$PROJECT" >/dev/null || exit

if [ ! -L ~/bin/$PROJECT ]; then
	install_package libusb-1.0-0-dev

	mkdir -p build
	pushd build >/dev/null || exit

	cmake ..
	run_make
	ln -s "$(realpath $PROJECT)" ~/bin/$PROJECT

	popd >/dev/null || exit
fi

# Install the udev rule.
install_udev_rule udev/99-$PROJECT.rules

popd >/dev/null || exit

~/bin/$PROJECT version
