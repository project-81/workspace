#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
# shellcheck source=common.sh
. "$REPO/scripts/common.sh"

pushd "$THIRD_PARTY/WSL2-Linux-Kernel" >/dev/null || exit

sudo make "-j$(nproc)" KCONFIG_CONFIG=Microsoft/config-wsl
sudo make modules_install

cp ./arch/x86_64/boot/bzImage "/mnt/c/Users/$USER/"
cp "$SCRIPTS/wsl/.wslconfig" "/mnt/c/Users/$USER/"

popd >/dev/null || exit
