#!/bin/bash

# Script is designed for openSUSE bootstrapping only.
assert_opensuse

TASKS+=(init update git python go zsh fzf-src)
TASKS+=(neovim rcmpy ninja-src tio rust)

PACKAGES+=(tmux htop tree rsync psmisc ack mtools graphviz)
PACKAGES+=(gcc make autoconf bison flex makeinfo help2man patch libtool)

# unused: swig
PACKAGES+=(ShellCheck universal-ctags dtc)
