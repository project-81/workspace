#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
# shellcheck disable=SC1090
. "$REPO/scripts/common.sh"

pushd "$THIRD_PARTY/pico-examples" >/dev/null || exit

mkdir -p build
pushd build >/dev/null || exit

APP=blink

if [ ! -d $APP ]; then
	cmake ..
fi

pushd $APP >/dev/null || exit
make "-j$(nproc)"
picotool load $APP.uf2
picotool reboot
popd >/dev/null || exit

popd >/dev/null || exit

popd >/dev/null || exit
