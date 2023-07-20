# Install git.
if ! is_cmd git; then
	if is_opensuse; then
		install_package git-core
	fi
fi

git version

if [ ! -f "$REPO/config/README.md" ]; then
	# If we're not in the workspace, it's okay if this fails.
	git submodule update --init --recursive || true
fi
