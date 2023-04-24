#!/bin/bash

set -e

if [ ! -f ~/password.txt ]; then
	echo "File '~/password.txt' is missing (needed for 'sudo' password)!"
fi

# Ensure git is installed.
if ! type git >/dev/null; then
	PASS=$(cat ~/password.txt)
	echo "$PASS" | sudo -S zypper ref
	echo "$PASS" | sudo -S zypper up -y
	echo "$PASS" | sudo -S zypper install -y git-core
fi

git version
