#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
# shellcheck disable=SC1090,SC1091
. "$REPO/scripts/common.sh"

if ! type bmputil >/dev/null; then
	poke_ssh
	cargo install --git "$(github_ssh_url blackmagic-debug bmputil)"
fi

run_install blackmagic

safe_pushd "$REPO/scripts/raspberrypi"

# Update firmwar if necessary.
if [ ! -f blackmagic-native.elf ]; then
BASE_URL=https://github.com/blackmagic-debug/blackmagic/releases/download
wget $BASE_URL/v1.9.0/blackmagic-native-v1_9_0.elf -O blackmagic-native.elf

bmputil flash blackmagic-native.elf
fi

safe_popd
