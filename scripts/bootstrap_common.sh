#!/bin/bash

set -e

# Common bootstrapping tasks.

# Add github's SSH key so we can clone without a prompt.
if ! grep -q "github.com" ~/.ssh/known_hosts; then
	echo "github.com SSH key not found."
	ssh-keyscan github.com >> ~/.ssh/known_hosts
fi

# Clone the repository if necessary.
if [ ! -d ~/workspace ]; then
	cd && git clone git@github.com:project-81/workspace.git
fi

# Clone the repository and run the bootstrapping script.
cd ~/workspace && git pull
cd ~/workspace && ./scripts/bootstrap.sh
cd || exit
