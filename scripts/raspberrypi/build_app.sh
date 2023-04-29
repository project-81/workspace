#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
# shellcheck disable=SC1090,SC1091
. "$REPO/scripts/common.sh"

APP=blink
if [ "$1" ]; then
	APP="$1"
fi

safe_pushd "$THIRD_PARTY/pico-examples"

safe_pushd build

if [ ! -d "$APP" ]; then
	cmake -DCMAKE_BUILD_TYPE=Debug ..
fi

safe_pushd "$APP"

make "-j$(nproc)"
picotool load "$APP.uf2" || true
picotool reboot || true

safe_popd

safe_popd

safe_popd
