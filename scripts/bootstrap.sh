#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
. "$REPO/scripts/common.sh"

# Script is designed for openSUSE bootstrapping only.
assert_opensuse

set -x

for TASK in update git python rcmpy; do
	run_install $TASK
done

echo "Script completed successfully."
