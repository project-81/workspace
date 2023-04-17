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
with: `sudo zypper ref`.
1. Update currently installed packages with `sudo zypper up`.
1. If `zypper ps -s` lists any programs that need to be restarted (such as
`bash`, the shell program itself exit the current session with `exit` and
start a new one.
1. Run `git` and confirm you see the following output:

```
If 'git' is not a typo you can use command-not-found to lookup the package that contains it, like this:
    cnf git
```

3. Run `cnf git` as suggested to determine how to install
[Git](https://git-scm.com/). Confirm you see the following output:

```
The program 'git' can be found in the following package:
  * git-core [ path: /usr/bin/git, repository: zypp (repo-oss) ]

Try installing with:
    sudo zypper install git-core
```

4. Run `sudo zypper install git-core` as suggested and enter `y` (for yes)
when prompted.
4. Run `git version` to verify installation.
4. Run `python3.11` then `cnf python3.11` to reveal the next command to run:
`sudo zypper install python311-base`.
4. Run `python3.11 --version` to verify installation.
4. Install `pip3.11` with: `sudo zypper install python311-pip`.
4. Install [rcmpy](https://github.com/vkottler/rcmpy) with:
`pip install --user rcmpy`.

Proceed to [the next page](cloning-repositories.md) for instructions
on initial repository cloning and setup.
