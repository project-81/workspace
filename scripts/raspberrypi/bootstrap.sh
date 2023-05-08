#!/bin/bash

set -e

# Increase the size of swap memory.
sudo dphys-swapfile swapoff
echo "CONF_SWAPSIZE=2048" | sudo tee /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon

# Install git so we can clone the repository. The common bootstrapping script
# takes care of the rest.
if ! type git >/dev/null; then
	sudo apt-get update && sudo apt-get install git -y
fi
