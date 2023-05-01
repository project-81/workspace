#!/bin/bash

set -e && set -x

test -e "$1"

printf "\r\nimport machine; machine.bootloader()\r\n" | tio -r "$1"
