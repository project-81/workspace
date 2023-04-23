#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y

TASKS+=(git python neovim rcmpy zsh)

if is_rpi; then
	run_install raspberrypi
fi

PACKAGES+=(tmux)
