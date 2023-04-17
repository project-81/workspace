# Getting Started

([back](../README.md#documentation))

This section covers how to configure your personal workstation (laptop or
desktop) for engineering or other work.

Note: instructions assume that a
[Microsoft Windows](https://www.microsoft.com/en-us/windows) environment is
used. This allows for a native Linux environment via the
[Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/).

**Important: update your system to
[Windows 11](https://www.microsoft.com/software-download/windows11) and ensure
all available updates are installed.** Anecdotally, this seems to ensure that
most of the prerequisite steps are complete by default.

If another computing environment is used, some instructions may not apply.

## Linux

Software that runs in a production or embedded environment typically runs on a
[Linux](https://docs.kernel.org/)-based operating system. This is because it is
highly customizable, easy to introspect, extremely performant and has an
enormous community of free and open-source software.

Linux also refers to the
[operating system kernel](https://en.wikipedia.org/wiki/Kernel_%28operating_system%29),
but this is just an interface to the computer hardware. A full-fledged
graphical destkop environment, or even just a command-line terminal, is
typically powered by a
[Linux distribution](https://www.linux.org/pages/download/).

Choosing an appropriate distribution can be like scanning a tool drawer
for the right tool. Our Linux distribution of choice is:
[openSUSE Tumbleweed](https://get.opensuse.org/tumbleweed/).

### Why openSUSE Tumbleweed?

At the time of writing, it's the best option provided out-of-the-box by
the
[Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/):

```
C:\Users\vkottler> wsl -l --online
The following is a list of valid distributions that can be installed.
Install using 'wsl.exe --install <Distro>'.

NAME                                   FRIENDLY NAME
Ubuntu                                 Ubuntu
Debian                                 Debian GNU/Linux
kali-linux                             Kali Linux Rolling
Ubuntu-18.04                           Ubuntu 18.04 LTS
Ubuntu-20.04                           Ubuntu 20.04 LTS
Ubuntu-22.04                           Ubuntu 22.04 LTS
OracleLinux_8_5                        Oracle Linux 8.5
OracleLinux_7_9                        Oracle Linux 7.9
SUSE-Linux-Enterprise-Server-15-SP4    SUSE Linux Enterprise Server 15 SP4
openSUSE-Leap-15.4                     openSUSE Leap 15.4
openSUSE-Tumbleweed                    openSUSE Tumbleweed
```

When leveraging open-source software, staying ahead of the curve with the
latest-and-greatest system packages is a good strategy for keeping a software
ecosystem healthy.

In many cases, this can eliminate the need to build software from source,
because the community around the distribution is just as interested in taking
updates as we are.

Support for this distribution on Windows means that only a Windows computer
is needed to contribute to this organization's digital assets: a majority
of CAD and other kinds of software are exclusive to Windows.

Even with some evidence that it can be a good distribution, it's still good
to remain flexible and open to trying others!

Continue to the next section to begin setting up an instance of this
distribution on Windows.

### Windows Subsystem for Linux

*Note: "WSL" is often used as an abbreviation.*

When we need third-party software to work on something, it can be okay to just
find some installation means via the internet and proceed with installing.
When a team grows larger though, some standardization and automation for how
everyone manages software on their workstation can be beneficial.

Proceed to the next section to set up a software-package management
application.

#### Windows Package Manager

The [Windows Package Manager](https://github.com/microsoft/winget-cli) is a
relatively new tool from Microsoft that offers a command-line interface
for managing installed software. Microsoft offers a
[training module](https://learn.microsoft.com/en-us/training/modules/explore-windows-package-manager-tool/)
for the tool that is valuable for anyone that is not already familiar with
any number of command-line package management applications.

*Note: a fresh installation of
[Windows 11](https://www.microsoft.com/software-download/windows11) seems to
have this tool pre-installed.*

1. Open either Windows [PowerShell](https://github.com/PowerShell/PowerShell)
or Command Prompt (both should be installed by default).
1. Check if the tool is already installed with `winget -v`. If it's present
the version will be printed:

```
C:\Users\vaugh> winget -v
v1.4.10173
```

3. If it's not present open the Microsoft Store application and search for
`App Installer`.
4. Install the application and verify with
[these instructions](https://github.com/microsoft/terminal#via-windows-package-manager-cli-aka-winget).

With the package manager now installed, proceed to the next section for
installing an initial application.

#### Windows Terminal

It is common to interact with a Linux system via the command-line interface.
Because of this, it's a good idea to install and get comfortable with
[Windows Terminal](https://github.com/microsoft/terminal).

1. Check if it's already installed with:
`winget show Microsoft.WindowsTerminal`.
1. If it's not installed yet, run `winget install Microsoft.WindowsTerminal`.

*Note: a fresh installation of
[Windows 11](https://www.microsoft.com/software-download/windows11) seems to
have the terminal pre-installed.*

The terminal is highly customizable. Microsoft provides
[an abundance of documentation](https://learn.microsoft.com/en-us/windows/terminal/)
for how to use and configure it.

When installed, the application can be opened by searching for the application
named "Terminal" in the start menu.

Open it and proceed to the next section for installing WSL.

#### Installation

*Note: a fresh installation of
[Windows 11](https://www.microsoft.com/software-download/windows11) seems to
have WSL pre-installed.*

1. Check if WSL is already installed with `wsl -v`. If it's present, some
version information will be printed:

```
C:\Users\vaugh> wsl -v
WSL version: 1.1.6.0
Kernel version: 5.15.90.1
WSLg version: 1.0.50
MSRDC version: 1.2.3770
Direct3D version: 1.608.2-61064218
DXCore version: 10.0.25131.1002-220531-1700.rs-onecore-base2-hyp
Windows version: 10.0.22621.1555
C:\Users\vaugh> wsl -v
WSL version: 1.1.6.0
Kernel version: 5.15.90.1
WSLg version: 1.0.50
MSRDC version: 1.2.3770
Direct3D version: 1.608.2-61064218
DXCore version: 10.0.25131.1002-220531-1700.rs-onecore-base2-hyp
Windows version: 10.0.22621.1555
```

If it's not installed yet, something like this might print:

```
Copyright (c) Microsoft Corporation. All rights reserved.

Usage: wsl.exe [Argument]

Arguments:

...
```

If this output appears, run `wsl --install` and navigate through a few prompts.
You may need to reboot when complete as well.

2. If it's not installed, proceed to the
[installation instructions](https://learn.microsoft.com/en-us/windows/wsl/install)
online.
3. Install WSL and ensure that it's installed (repeat step 1).

Proceed to [the next page](openSUSE-Tumbleweed.md) for instructions on
instaling distributions.
