#!/bin/bash

# tio
TASKS+=(git autoconf-src python rcmpy neovim zsh ninja-src)

PACKAGES+=("python$PYTHON_VERSION" "python$PYTHON_VERSION-pip")
PACKAGES+=(automake texinfo help2man libtool patch gcc-c++ ShellCheck)

for MOD in Time-HiRes Capture-Tiny Module-Load-Conditional DateTime JSON-XS; do
	PACKAGES+=("perl-$MOD")
done
