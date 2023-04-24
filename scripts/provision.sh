function provision() {
	if [ -z "$1" ]; then
		echo "Must specify a host."
	fi

	await_pingable "$1"

	# Add ssh keys.
	add_ssh_keys.sh "$1"

	SSH_ARG="$USER@$(ipv4_addr "$1")"
	SSH_ARGS=(ssh -o "StrictHostKeyChecking=no" "$SSH_ARG")

	"${SSH_ARGS[@]}" "rm -f ~/bootstrap.sh"

	ORG=project-81
	REPO=workspace
	BRANCH=master
	URL_BASE=https://raw.githubusercontent.com/$ORG/$REPO/$BRANCH

	# Run these bootstrapping scripts in order.
	SCRIPTS=("scripts/$2/bootstrap.sh")
	SCRIPTS+=("scripts/bootstrap_common.sh")

	for SCRIPT in "${SCRIPTS[@]}"; do
		# shellcheck disable=SC2029
		"${SSH_ARGS[@]}" "curl $URL_BASE/$SCRIPT -so ~/tmp.sh"

		# Run the bootstrapping script.
		time "${SSH_ARGS[@]}" "sh ~/tmp.sh"
		echo "Completed '$SCRIPT' bootstrapping."
		"${SSH_ARGS[@]}" "rm -f ~/tmp.sh"
	done

	echo "Provisioning succeeded!"
}
