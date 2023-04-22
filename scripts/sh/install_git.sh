# Install git.
install_package git-core
git version

# If we're not in the workspace, it's okay if this fails.
git submodule update --init --recursive || true
