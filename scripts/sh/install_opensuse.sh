#!/bin/bash

# Script is designed for openSUSE bootstrapping only.
assert_opensuse

TASKS+=(init update git python go zsh neovim rcmpy ninja-src)
PACKAGES+=(tmux htop rsync psmisc ack)
