# workspace

This repository is a container for all organization projects. It is a place
to integrate developer workflows (or continuous integration) for the entire
ecosystem.

# Getting Started

This section covers how to configure your personal workstation (laptop or
desktop) for engineering or other work.

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

TODO.
