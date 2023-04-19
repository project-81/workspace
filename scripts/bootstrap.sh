#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
. "$REPO/scripts/common.sh"

# Script is designed for openSUSE bootstrapping only.
assert_opensuse

set -x

TASKS=(update git python rcmpy tmux)

for TASK in "${TASKS[@]}"; do
	run_install "$TASK"
done

echo "Script completed successfully."
