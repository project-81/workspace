#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y

TASKS+=(git python rcmpy neovim zsh)

if is_rpi; then
	run_install raspberrypi
fi

PACKAGES+=(tmux)
