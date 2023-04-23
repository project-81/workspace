#!/bin/bash

if [ "$WORKSPACE" ] && [ -d "$WORKSPACE" ]; then
	REPO="$WORKSPACE"
else
	REPO=$(git rev-parse --show-toplevel)
fi

# shellcheck source=common.sh
. "$REPO/scripts/common.sh"

# Script is designed for openSUSE bootstrapping only.
assert_opensuse

# Link the bootstrapping script so we can just run 'bootstrap'.
if [ ! -L "$HOME/bin/bootstrap" ]; then
	ln -s "$SCRIPTS/bootstrap.sh" "$HOME/bin/bootstrap"
fi

set -x

if [ "$1" ]; then
	TASKS=("$1")
else
	TASKS=(init update git python go zsh neovim rcmpy)
fi

# Run installation tasks.
for TASK in "${TASKS[@]}"; do
	run_install "$TASK"
done

if [ -z "$1" ]; then
	PACKAGES=(tmux openocd htop)

	# Install basic packages.
	for PKG in "${PACKAGES[@]}"; do
		install_package "$PKG"
	done
fi

echo "Script completed successfully."
