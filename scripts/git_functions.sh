git_ssh_url() {
	echo "ssh://$1@$2/$3/$4.git"
}

github_ssh_url() {
	git_ssh_url git github.com "$1" "$2"
}

clone_third_party_ssh() {
	safe_pushd "$THIRD_PARTY"

	local user=$1 && shift
	local host=$1 && shift
	local project=$1 && shift
	local repo=$1 && shift

	if [ ! -d "$repo" ]; then
		git clone "$@" "ssh://$user@$host/$project/$repo.git"
		echo "Cloned '$project/$repo'."
	else
		echo "Not cloning '$project/$repo', already present."
	fi

	# Update the repository while we're here.
	safe_pushd "$repo"

	# This can fail if HEAD is detached.
	git pull --prune || true

	git submodule update --init
	safe_popd

	safe_popd
}

clone_third_party_github() {
	clone_third_party_ssh git github.com "$@"
}

clone_third_party_github_shallow() {
	clone_third_party_ssh git github.com "$@" --depth=1 --single-branch
}
