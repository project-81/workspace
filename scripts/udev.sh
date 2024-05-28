#!/bin/bash

REPO=$(git rev-parse --show-toplevel)
# shellcheck source=common.sh
. "$REPO/scripts/common.sh"

# DEVICE=/dev/sdb
# udevadm info -a -n $DEVICE | less

set -x

sudo_cmd cp "$REPO/data/99-analog-discovery.rules" /etc/udev/rules.d
sudo_cmd udevadm control --reload-rules
