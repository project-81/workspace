#!/bin/bash

CLANG_VERSION=19

if ! is_cmd clang-$CLANG_VERSION; then
	wget https://apt.llvm.org/llvm.sh
	chmod +x ./llvm.sh
	sudo ./llvm.sh $CLANG_VERSION
	rm llvm.sh
fi

PACKAGES+=("clang-$CLANG_VERSION" "clang++-$CLANG_VERSION")
PACKAGES+=("clang-format-$CLANG_VERSION")
