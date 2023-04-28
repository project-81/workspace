#!/bin/bash

set -e

# Install git so we can clone the repository. The common bootstrapping script
# takes care of the rest.
if ! type git >/dev/null; then
	sudo apt-get update && sudo apt-get install git -y
fi
