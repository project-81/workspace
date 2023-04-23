#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y

# Install git so we can clone the repository.
sudo apt-get install git

# Clone the repository and run the bootstrapping script.
cd && git clone git@github.com:project-81/workspace.git
cd ~/workspace && ./scripts/bootstrap.sh
cd || exit
