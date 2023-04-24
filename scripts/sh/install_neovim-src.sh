#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
# shellcheck disable=SC1090,SC1091
. "$REPO/scripts/common.sh"

if is_cmd nvim; then
	return
fi

if ! is_cmd cmake; then
	if is_opensuse; then
		install_package cmake-full
	fi
fi

if ! is_cmd msgmerge; then
	if is_opensuse; then
		install_package gettext-tools
	else
		install_package gettext
	fi
fi

PROJECT=neovim
VERSION=0.9

clone_third_party_github $PROJECT $PROJECT \
	--depth=1 --single-branch "release-$VERSION"
safe_pushd "$THIRD_PARTY/$PROJECT"

git fetch
git checkout stable

# Build dependencies.
mkdir -p .deps
safe_pushd .deps
cmake ../cmake.deps
make "-j$(nproc)"
safe_popd

make "-j$(nproc)" CMAKE_BUILD_TYPE=Release

sudo make install

safe_popd
