#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
. "$REPO/scripts/common.sh"

# Script is designed for openSUSE bootstrapping only.
assert_opensuse

git submodule update --init --recursive

set -x

# Update software.
zypper --version
sudo zypper ref
sudo zypper up -y
sudo zypper dup -y

# Install git.
sudo zypper install -y git-core
git version

# Install Python.
sudo zypper install -y python${PYTHON_VERSION/./}-base
sudo zypper install -y python${PYTHON_VERSION/./}-pip

# Install rcmpy.
pip install --user rcmpy
rcmpy --version

# Update rcmpy.
rcmpy use "$REPO/config/rcmpy"
rcmpy variant "$USER"
rcmpy apply

echo "Script completed successfully."
