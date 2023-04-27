#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
# shellcheck disable=SC1090,SC1091
. "$REPO/scripts/common.sh"

PROJECT=pi-gen

install_package quilt qemu-user-static debootstrap zerofree libarchive-tools \
	bc qemu-utils kpartx

clone_third_party_github_shallow RPi-Distro $PROJECT "--branch=master"
safe_pushd "$THIRD_PARTY/$PROJECT"

echo "IMG_NAME=Raspbian" > config

add_setting() {
echo "$1=$2" >> config
}

# Freedom settings.
add_setting LOCALE_DEFAULT en_US.UTF-8
add_setting KEYBOARD_KEYMAP us
add_setting KEYBOARD_LAYOUT "\"English (US)\""
add_setting TIMEZONE_DEFAULT America/Chicago
add_setting ENABLE_SSH 1
add_setting PUBKEY_ONLY_SSH 1
add_setting PUBKEY_SSH_FIRST_USER "\"$(cat "$HOME/.ssh/id_rsa.pub")\""
add_setting SETFCAP 1

read -r -p "Hostname? " HOSTNAME
add_setting TARGET_HOSTNAME "$HOSTNAME"

add_setting FIRST_USER_NAME "$USER"

read -r -p "$USER (first user)'s password? " FIRST_USER_PASS
add_setting FIRST_USER_PASS "$FIRST_USER_PASS"
add_setting DISABLE_FIRST_BOOT_USER_RENAME 1

sudo ./build.sh -c config

safe_popd
