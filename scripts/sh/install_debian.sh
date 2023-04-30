#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y

TASKS+=(git python micropython rcmpy neovim zsh ninja-src tio)

if is_rpi; then
	run_install raspberrypi
fi

PACKAGES+=(tmux)
