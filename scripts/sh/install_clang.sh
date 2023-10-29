#!/bin/bash

CLANG_VERSION=17

if ! is_cmd clang-$CLANG_VERSION; then
	wget https://apt.llvm.org/llvm.sh
	chmod +x ./llvm.sh
	sudo ./llvm.sh 17
	rm llvm.sh
fi

PACKAGES+=("clang-$CLANG_VERSION" "clang++-$CLANG_VERSION")
PACKAGES+=("clang-format-$CLANG_VERSION")
