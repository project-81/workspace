#!/bin/bash

[ "$WORKSPACE" ] || export WORKSPACE=$HOME/workspace
if [ -d "$WORKSPACE" ]; then
	REPO="$WORKSPACE"
else
	REPO=$(git rev-parse --show-toplevel)
fi

# shellcheck source=common.sh
. "$REPO/scripts/common.sh"

# Link the bootstrapping script so we can just run 'bootstrap'.
if [ ! -L "$HOME/bin/bootstrap" ]; then
	mkdir -p "$HOME/bin"
	mkdir -p "$HOME/.local/bin"
	ln -s "$SCRIPTS/bootstrap.sh" "$HOME/bin/bootstrap"
fi

TASKS=()
PACKAGES=()

if [ "$1" ]; then
	TASKS=("$1")
else
	TASKS=()

	if is_opensuse; then
		run_install opensuse
	elif is_debian; then
		run_install debian
	fi
fi

# Install basic packages.
install_package "${PACKAGES[@]}";

# Run installation tasks.
for TASK in "${TASKS[@]}"; do
	run_install "$TASK"
done

echo "Script completed successfully."
