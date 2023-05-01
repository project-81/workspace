#!/bin/bash

REPO=$(git rev-parse --show-toplevel)

CWD="$REPO/scripts/raspberrypi"

BOARD=PICO
"$CWD/flash_pi_openocd.sh" \
	~/third-party/micropython/ports/rp2/build-$BOARD/firmware
