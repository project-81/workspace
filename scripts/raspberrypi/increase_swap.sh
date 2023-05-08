#!/bin/bash

set -e

# Increase the size of swap memory.

set -x

sudo dphys-swapfile swapoff
echo "CONF_SWAPSIZE=2048" | sudo tee /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
