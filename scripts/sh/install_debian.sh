#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y

TASKS+=(git python micropython circuitpython rcmpy neovim zsh ninja-src tio)

TASKS+=(picotool openocd go fzf-src rust)

if is_rpi; then
	run_install raspberrypi
fi

REPOS=(pico-sdk pico-examples pico-extras pico-playground pico-bootrom)
REPOS+=(picotool picoprobe)
REPOS+=(openocd picoprobe)

for repo in "${REPOS[@]}"; do
	clone_third_party_github raspberrypi "$repo"
done

# build tools
PACKAGES+=(cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential)
PACKAGES+=(libstdc++-arm-none-eabi-newlib)

if is_rpi || is_wsl; then
	PACKAGES+=(libusb-1.0-0-dev)
else
	PACKAGES+=(libusb-dev pkgconf)
fi

# gdb
PACKAGES+=(gdb-multiarch)

# utilities
PACKAGES+=(tmux ack htop mtools shellcheck)
