#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y

# micropython circuitpython
TASKS+=(git python rcmpy neovim zsh ninja-src tio)

TASKS+=(picotool go fzf-src rust)

if is_rpi; then
	run_install raspberrypi
fi

# build tools
PACKAGES+=(cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential)
PACKAGES+=(libstdc++-arm-none-eabi-newlib)

# gnu
PACKAGES+=(autoconf automake texinfo flex bison help2man gawk libtool-bin)

# unused: swig
PACKAGES+=(device-tree-compiler pkgconf libncurses-dev)

# gdb
PACKAGES+=(gdb-multiarch)

# utilities
PACKAGES+=(tmux ack htop mtools shellcheck tree)
