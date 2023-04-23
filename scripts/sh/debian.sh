#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y

TASKS+=(git python rcmpy zsh)

if is_rpi; then
	echo "is pi"
fi

PACKAGES+=(tmux)
