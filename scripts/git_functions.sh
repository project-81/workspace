git_ssh_url() {
	echo "ssh://$1@$2/$3/$4.git"
}

github_ssh_url() {
	git_ssh_url git github.com "$1" "$2"
}

clone_third_party_ssh() {
	mkdir -p "$THIRD_PARTY"
	pushd "$THIRD_PARTY" >/dev/null || exit

	local USER=$1 && shift
	local HOST=$1 && shift
	local PROJECT=$1 && shift
	local REPO=$1 && shift

	if [ ! -d "$REPO" ]; then
		git clone "$@" "ssh://$USER@$HOST/$PROJECT/$REPO.git"
		echo "Cloned '$PROJECT/$REPO'."
	else
		echo "Not cloning '$PROJECT/$REPO', already present."
	fi

	# Update the repository while we're here.
	pushd "$REPO" >/dev/null || exit

	# This can fail if HEAD is detached.
	git pull --prune || true

	git submodule update --init
	popd >/dev/null || exit

	popd >/dev/null || exit
}

clone_third_party_github() {
	clone_third_party_ssh git github.com "$@"
}

clone_third_party_github_shallow() {
	clone_third_party_ssh git github.com "$@" --depth=1 --single-branch
}
