#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
. "$REPO/scripts/common.sh"

# Script is designed for openSUSE bootstrapping only.
assert_opensuse

set -x

# Update software.
zypper --version
sudo zypper ref
sudo zypper up -y
sudo zypper dup -y

# Install git.
sudo zypper install git-core -y
git version

# Install Python.
sudo zypper install python${PYTHON_VERSION/./}-base -y
sudo zypper install python${PYTHON_VERSION/./}-pip -y

echo "Script completed successfully."
