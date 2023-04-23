#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
# shellcheck disable=SC1091
. "$REPO/scripts/common.sh"

if [ -z "$1" ]; then
	echo "Must specify a host."
fi

await_pingable "$1"

# Add ssh keys.
add_ssh_keys.sh "$1"

# Run the bootstrapping script.
URL_BASE=https://raw.githubusercontent.com/project-81/workspace/master
# shellcheck disable=SC2029
ssh "$USER@$(ipv4_addr "$1")" \
	"curl $URL_BASE/scripts/raspberrypi/bootstrap.sh -sSf | sh"

echo "Provisioning succeeded!"
