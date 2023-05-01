#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
# shellcheck disable=SC1090,SC1091
. "$REPO/scripts/common.sh"

CWD=$REPO/scripts/beagleboard
# shellcheck disable=SC1090,SC1091
. "$CWD/common.sh"

safe_pushd "$CWD"

HOST=mycloudex2ultra
mkdir -p ./$HOST

set -x

sudo mount \
	-t cifs \
	-o username=admin,password=password,uid="$USER",gid="$USER" \
	"//$(ipv4_addr $HOST)/Public" \
	./$HOST

set +x

ls ./$HOST

safe_popd
