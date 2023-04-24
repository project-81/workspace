clone_third_party_ssh() {
	mkdir -p "$THIRD_PARTY"
	pushd "$THIRD_PARTY" >/dev/null || exit

	if [ ! -d "$2" ]; then
		git clone "$3@$4:$1/$2.git"
		echo "Cloned '$1/$2'."
	else
		echo "Not cloning '$1/$2', already present."
	fi

	# Update the repository while we're here.
	pushd "$2" >/dev/null || exit

	# This can fail if HEAD is detached.
	git pull --prune || true

	git submodule update --init
	popd >/dev/null || exit

	popd >/dev/null || exit
}

clone_third_party_github() {
	clone_third_party_ssh "$1" "$2" git github.com
}
