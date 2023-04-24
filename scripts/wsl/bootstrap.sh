#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
# shellcheck source=common.sh
. "$REPO/scripts/common.sh"

clone_third_party_github_shallow microsoft WSL2-Linux-Kernel \
	--branch=linux-msft-wsl-5.15.y

install_package make
install_package ncurses-devel
install_package flex
install_package bison
install_package libopenssl-devel
install_package libelf-devel
install_package bc
install_package dwarves

safe_pushd "$THIRD_PARTY/WSL2-Linux-Kernel"

export KCONFIG_CONFIG=Microsoft/config-wsl
make menuconfig

safe_popd
