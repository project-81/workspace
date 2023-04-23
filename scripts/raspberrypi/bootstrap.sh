#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
# shellcheck source=common.sh
. "$REPO/scripts/common.sh"

install_package rpi-imager
install_package libqt5-qtquickcontrols2
install_package util-linux-systemd
install_package usbutils
install_package usbip
