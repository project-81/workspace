# [openSUSE Tumbleweed](https://get.opensuse.org/tumbleweed/)

([back](../README.md#documentation))

See [Getting Started](getting-started.md#linux) documentation for discussion
on choosing this Linux distribution.

## Installation

### Windows Subsystem for Linux

Note: if something goes wrong and you want to try starting over, you can
run: `wsl --unregister openSUSE-Tumbleweed`.

1. Open PowerShell in Windows Terminal and run:
`wsl --install openSUSE-Tumbleweed`.
1. Begin following installation prompts (`Hit Next to continue` is the first
prompt at the time of writing). Note that the keyboard is used to navigate
menus and prompts (tab, arrow keys, enter).
1. Accept EULA.
1. Create a user for yourself. When choosing a password, consider that your
user account is isolated to the WSL distribution. It's convenient to use a
simpler or weaker password (and not typical to manually configure remote
access to it). Ensure that your password is used for the system administrator.
1. Accept a prompt to really use your password if you get one.
1. Navigate to `Finish` once the installer completes.
1. At the new command prompt, try `sudo test` and enter your password to ensure
that you can successfully run commands as the `root` user.

Proceed to the next section to begin setting up the freshly installed Linux
distribution.

## Bootstrapping a Fresh Installation

1. Update your system's information about internet package repositories
with: `sudo zypper ref`

TODO - instructions for initial setup on openSUSE out of the box. Install
`git`, etc.

## Cloning Repositories

Documentation continues [here](cloning-repositories.md).
