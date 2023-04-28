#!/bin/bash

IMAGE=~/2023-04-28-Raspbian-lite.img
CARD=/dev/sda

set -e && set -x

sudo dd if=$IMAGE of=$CARD bs=1M && sync

echo "'$IAMGE' written to '$CARD' successfully."
