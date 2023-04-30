#!/bin/bash

if ! is_rpi; then
	exit 1
fi

REPOS=(pico-sdk pico-examples pico-extras pico-playground pico-bootrom)
REPOS+=(picotool picoprobe)
REPOS+=(openocd picoprobe)

for repo in "${REPOS[@]}"; do
	clone_third_party_github raspberrypi "$repo"
done
TASKS+=(picotool openocd)

PACKAGES+=(cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential)
PACKAGES+=(libstdc++-arm-none-eabi-newlib)
PACKAGES+=(libusb-1.0-0-dev)

# openocd
PACKAGES+=(automake autoconf texinfo libtool libftdi-dev)

# gdb
PACKAGES+=(gdb-multiarch)
