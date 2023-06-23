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
	elif is_debian || is_ubuntu; then
		run_install debian
	elif is_centos; then
		run_install centos
	fi
fi

install_all_packages() {
	# Install basic packages.
	if [ ${#PACKAGES[@]} -ne 0 ]; then
		install_package "${PACKAGES[@]}";
	fi
}

install_all_packages

# Run installation tasks.
for TASK in "${TASKS[@]}"; do
	run_install "$TASK"
done

if [ "$1" ]; then
	install_all_packages
fi

echo "Script completed successfully."
