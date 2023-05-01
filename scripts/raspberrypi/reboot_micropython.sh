#!/bin/bash

set -e && set -x

test -f "$1"

printf "\r\nimport machine; machine.bootloader()\r\n" | tio -r "$1"
