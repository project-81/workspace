#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
. "$REPO/scripts/common.sh"

# Script is designed for openSUSE bootstrapping only.
assert_opensuse

set -x

TASKS=(init update git python go zsh rcmpy)

# Run installation tasks.
for TASK in "${TASKS[@]}"; do
	run_install "$TASK"
done

PACKAGES=(tmux neovim)

# Install basic packages.
for PKG in "${PACKAGES[@]}"; do
	install_package "$PKG"
done

echo "Script completed successfully."
