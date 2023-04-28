#!/bin/bash

set -e

if [ ! -f ~/password.txt ]; then
	echo "File '~/password.txt' is missing (needed for 'sudo' password)!"
fi

# Install git so we can clone the repository. The common bootstrapping script
# takes care of the rest.
if ! type git >/dev/null; then
	PASS=$(cat ~/password.txt)
	echo "$PASS" | sudo -S apt-get update
	echo "$PASS" | sudo -S apt-get install git -y
fi
