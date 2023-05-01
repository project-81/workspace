#!/bin/bash

IMAGE=bone-debian-10.3-iot-armhf-2020-04-06-4gb.img
CARD=/dev/sda

REPO=$(git rev-parse --show-toplevel)
CWD=$REPO/scripts/beagleboard
# shellcheck disable=SC1090,SC1091
. "$CWD/common.sh"

IMAGE_REL="$CWD/$HOST/Users/vkottler/OS Images"

set -e && set -x

test -f "$IMAGE_REL/$IMAGE"

sudo dd if="$IMAGE_REL/$IMAGE" of=$CARD bs=1M && sync

set +x

echo "'$IMAGE' written to '$CARD' successfully."
