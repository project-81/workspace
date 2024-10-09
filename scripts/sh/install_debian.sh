#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y

# micropython circuitpython
TASKS+=(locale git python rcmpy pkgconf lua neovim zsh ninja-src tio)

TASKS+=(picotool go fzf-src rust)

if is_rpi; then
	run_install raspberrypi
fi

# build tools
PACKAGES+=(cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential)
PACKAGES+=(libstdc++-arm-none-eabi-newlib mold)
if ! is_rpi; then
	PACKAGES+=(gcc-13 g++-13)
fi

PACKAGES+=(emscripten)

# gnu
PACKAGES+=(autoconf automake texinfo flex bison help2man gawk libtool-bin)

# unused: swig
PACKAGES+=(device-tree-compiler libncurses-dev)

# gdb and other dev tooling
PACKAGES+=(gdb-multiarch lcov)

# utilities
PACKAGES+=(tmux ack htop mtools shellcheck tree xdg-utils)

if is_wsl; then
	PACKAGES+=(wslu)
else
	TASKS+=(openocd)
fi

if ! is_rpi; then
	# ubuntu seems to be required
	TASKS+=(clang)

	if ! is_wsl; then
		# stuff for kicad
		# PACKAGES+=(libglu1-mesa-dev libgl1-mesa-dev libglew-dev)
		# PACKAGES+=(libglm-dev)
		# PACKAGES+=(libcurl4-openssl-dev libcairo2-dev libboost-all-dev)

		# PACKAGES+=(libharfbuzz-dev libngspice0-dev)

		# PACKAGES+=(libocct-modeling-algorithms-dev)
		# PACKAGES+=(libocct-modeling-data-dev)
		# PACKAGES+=(libocct-data-exchange-dev)
		# PACKAGES+=(libocct-visualization-dev)
		# PACKAGES+=(libocct-foundation-dev)
		# PACKAGES+=(libocct-ocaf-dev)

		# PACKAGES+=(swig4.0 unixodbc-dev)

		# We may need to figure this out at some point.
		if ! is_pop; then
			PACKAGES+=(libwxgtk3.2-dev libgtk-3-dev)
		fi
	fi

	# stuff for lcov
	PACKAGES+=(libcapture-tiny-perl libdatetime-perl)
	PACKAGES+=(doxygen)
fi
