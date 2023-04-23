#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
# shellcheck source=common.sh
. "$REPO/scripts/common.sh"

clone_third_party_github microsoft WSL2-Linux-Kernel

install_package make
install_package ncurses-devel
install_package flex
install_package bison
install_package libopenssl-devel
install_package libelf-devel
install_package bc
install_package dwarves

pushd "$THIRD_PARTY/WSL2-Linux-Kernel" >/dev/null || exit

export KCONFIG_CONFIG=Microsoft/config-wsl
make menuconfig

popd >/dev/null || exit
