#!/bin/bash

TASKS+=(openocd)

# REPOS=(pico-examples pico-extras pico-playground)
REPOS=(pico-bootrom picoprobe openocd)

for repo in "${REPOS[@]}"; do
	clone_third_party_github raspberrypi "$repo"
done

# pick one of the keyboards
PACKAGES+=(i2c-tools wvkbd)

# https://forums.raspberrypi.com/viewtopic.php?t=358654
# in file .config/wf-panel-pi.ini ADD the following:
# autohide=true
# autohide_duration=500
