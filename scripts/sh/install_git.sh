# Install git.
if is_opensuse; then
	install_package git-core
fi

git version

# If we're not in the workspace, it's okay if this fails.
git submodule update --init --recursive || true
