#!/bin/bash

set -e

mkdir -p camera
set -x
libcamera-jpeg -t 1 "$@" -o "camera/$(date -Iseconds).jpg"
