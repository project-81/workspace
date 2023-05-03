#!/bin/bash

# Script is designed for openSUSE bootstrapping only.
assert_opensuse

TASKS+=(init update git python-src go zsh fzf-src)
TASKS+=(neovim rcmpy ninja-src tio rust)

PACKAGES+=(tmux htop rsync psmisc ack mtools)
