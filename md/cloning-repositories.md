# Cloning Repositories

([back](../README.md#documentation))

1. If you don't have one already,
[create a GitHub account](https://github.com/join).
1. If you don't have an SSH key pair (or if you don't have it associated with
your account), follow
[these instructions](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
to add one.

An SSH key pair can be reused across multiple machines or WSL distributions,
but it's up to you on whether or not you want to re-use an existing one.

One way to copy keys from an existing distribution:

```
cd /mnt/wsl
cp ~/.ssh/id_rsa* .
```

Then, on the new distribution:

```
mkdir ~/.ssh
cd ~/.ssh
cp /mnt/wsl/id_rsa* .
```

3. Issue the following commands:

```
cd
git clone git@github.com:project-81/workspace.git
```

This ensures that the workspace repository will be present in your home
directory. Next, bootstrap your environment with:

```
cd workspace
./scripts/bootstrap.sh
```

This will prompt you for your password to perform a number of commands relying
on `sudo` to install (or update) a few system packages.

This script will also initialize and update
[submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules).
