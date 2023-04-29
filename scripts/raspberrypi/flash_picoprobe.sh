#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
# shellcheck disable=SC1090,SC1091
. "$REPO/scripts/common.sh"

PROJECT=picoprobe
clone_third_party_github raspberrypi $PROJECT
safe_pushd "$THIRD_PARTY/$PROJECT"

picotool load "build/$PROJECT.uf2"
picotool reboot

safe_popd
