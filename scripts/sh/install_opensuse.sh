#!/bin/bash

# Script is designed for openSUSE bootstrapping only.
assert_opensuse

TASKS+=(init update git python go zsh fzf-src neovim rcmpy ninja-src tio)
PACKAGES+=(tmux htop rsync psmisc ack)
