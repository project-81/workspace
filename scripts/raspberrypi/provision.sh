#!/bin/bash

set -e

REPO=$(git rev-parse --show-toplevel)
# shellcheck disable=SC1091
. "$REPO/scripts/common.sh"

if [ -z "$1" ]; then
	echo "Must specify a host."
fi

await_pingable "$1"

# Add ssh keys.
add_ssh_keys.sh "$1"

SSH_ARG="$USER@$(ipv4_addr "$1")"

ssh "$SSH_ARG" "rm -f ~/bootstrap.sh"

URL_BASE=https://raw.githubusercontent.com/project-81/workspace/master

# shellcheck disable=SC2029
ssh "$SSH_ARG" \
	"curl $URL_BASE/scripts/raspberrypi/bootstrap.sh -so ~/bootstrap.sh"

# Run the bootstrapping script.
ssh "$SSH_ARG" "sh ~/bootstrap.sh"

ssh "$SSH_ARG" "rm -f ~/bootstrap.sh"

echo "Provisioning succeeded!"
