#!/bin/bash

set -e

# Ensure git is installed.
if ! type git >/dev/null; then
	sudo -S zypper ref
	sudo -S zypper up -y
	sudo -S zypper install -y git-core
fi

git version
