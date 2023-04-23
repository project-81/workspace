#!/bin/bash

set -e

# Install git so we can clone the repository.
sudo apt-get install git -y

# Clone the repository and run the bootstrapping script.
cd && git clone git@github.com:project-81/workspace.git
cd ~/workspace && ./scripts/bootstrap.sh
cd || exit
