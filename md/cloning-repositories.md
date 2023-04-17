# Cloning Repositories

([back](../README.md#documentation))

1. If you don't have one already,
[create a GitHub account](https://github.com/join).
1. If you don't have an SSH key pair (or if you don't have it associated with
your account), follow
[these instructions](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
to add one.
1. Issue the following commands:

```
cd
git clone git@github.com:project-81/workspace.git
```

This ensures that the workspace repository will be present in your home
directory. Next, initialize submodules with:

```
cd workspace
git submodule update --init --recursive
```

TODO - `pip install rcmpy` instructions, project-81 data repository.
