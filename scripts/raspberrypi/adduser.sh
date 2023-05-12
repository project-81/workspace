#!/bin/bash

set -e

sudo adduser "$1"

for GROUP in sudo audio video plugdev users input netdev gpio i2c spi; do
	sudo usermod -aG $GROUP "$1"
done
