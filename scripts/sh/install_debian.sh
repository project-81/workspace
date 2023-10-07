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
PACKAGES+=(libstdc++-arm-none-eabi-newlib mold)

# gnu
PACKAGES+=(autoconf automake texinfo flex bison help2man gawk libtool-bin)

# unused: swig
PACKAGES+=(device-tree-compiler pkgconf libncurses-dev)


# gdb and other dev tooling
PACKAGES+=(gdb-multiarch lcov clang clang-format)

# utilities
PACKAGES+=(tmux ack htop mtools shellcheck tree)

if ! is_rpi; then
	if ! is_wsl; then
		# stuff for kicad
		PACKAGES+=(libglu1-mesa-dev libgl1-mesa-dev libglew-dev)
		PACKAGES+=(libglm-dev)
		PACKAGES+=(libcurl4-openssl-dev libcairo2-dev libboost-all-dev)

		PACKAGES+=(libharfbuzz-dev libngspice0-dev)

		PACKAGES+=(libocct-modeling-algorithms-dev)
		PACKAGES+=(libocct-modeling-data-dev)
		PACKAGES+=(libocct-data-exchange-dev)
		PACKAGES+=(libocct-visualization-dev)
		PACKAGES+=(libocct-foundation-dev)
		PACKAGES+=(libocct-ocaf-dev)

		PACKAGES+=(swig4.0 unixodbc-dev)

		# We may need to figure this out at some point.
		if ! is_pop; then
			PACKAGES+=(libwxgtk3.2-dev libgtk-3-dev)
		fi
	fi

	# stuff for lcov
	PACKAGES+=(libcapture-tiny-perl libdatetime-perl)
fi
