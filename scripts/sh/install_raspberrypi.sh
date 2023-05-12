#!/bin/bash

TASKS+=(openocd)

# REPOS=(pico-examples pico-extras pico-playground)
REPOS=(pico-bootrom picoprobe openocd)

for repo in "${REPOS[@]}"; do
	clone_third_party_github raspberrypi "$repo"
done

PACKAGES+=(i2c-tools)
