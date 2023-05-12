#!/bin/bash

set -e && set -x
# libcamera-vid -t 0 --inline -o udp://127.0.0.1:5001
libcamera-vid \
	-t 0 \
	--inline \
	--listen \
	--level 4.2 \
	--denoise cdn_off \
	-o tcp://0.0.0.0:5001
