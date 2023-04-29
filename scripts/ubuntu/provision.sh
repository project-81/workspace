#!/bin/bash

set -e

REPO=$(git rev-parse --show-toplevel)

# shellcheck disable=SC1090,SC1091
. "$REPO/scripts/common.sh"

# shellcheck disable=SC1090,SC1091
. "$REPO/scripts/provision.sh"

provision "$1" ubuntu
