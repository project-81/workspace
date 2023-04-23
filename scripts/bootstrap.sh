#!/bin/bash

if [ "$WORKSPACE" ] && [ -d "$WORKSPACE" ]; then
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

if is_opensuse; then
	# shellcheck source=sh/opensuse.sh
	. "$SCRIPTS/sh/opensuse.sh"
elif is_debian; then
	# shellcheck source=sh/debian.sh
	. "$SCRIPTS/sh/debian.sh"
fi

echo "Script completed successfully."
