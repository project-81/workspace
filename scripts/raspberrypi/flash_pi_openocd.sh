#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
# shellcheck disable=SC1090,SC1091
. "$REPO/scripts/common.sh"

if [ ! -f "$1.elf" ]; then
	echo "'$1.elf' is not a file."
	exit 1
fi

openocd \
	-f interface/raspberrypi-swd.cfg \
	-f target/rp2040.cfg \
	-c "program $1.elf verify reset exit"

echo "Flashed '$1.elf'."
