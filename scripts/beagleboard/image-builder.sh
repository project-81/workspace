#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
# shellcheck disable=SC1090,SC1091
. "$REPO/scripts/common.sh"

PROJECT=image-builder

clone_third_party_github_shallow beagleboard $PROJECT "--branch=master"
safe_pushd "$THIRD_PARTY/$PROJECT"

./beagleboard.org_stretch_image.sh

safe_popd
