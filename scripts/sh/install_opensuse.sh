#!/bin/bash

# Script is designed for openSUSE bootstrapping only.
assert_opensuse

TASKS+=(init update git python go zsh neovim rcmpy)
PACKAGES+=(tmux htop rsync psmisc)
