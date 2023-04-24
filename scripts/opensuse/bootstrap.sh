#!/bin/bash

set -e

# Ensure git is installed.
if ! type git >/dev/null; then
	sudo zypper ref
	sudo zypper up -y
	sudo zypper install -y git-core
fi

git version
