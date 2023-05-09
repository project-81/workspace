#!/bin/bash

function provision() {
	if [ -z "$1" ]; then
		echo "Must specify a host."
	fi

	await_pingable "$1"

	# Remove this host as known (in case we're re-provisioning an existing
	# host).
	ssh-keygen -R "$1" -f ~/.ssh/known_hosts

	# Add ssh keys.
	add_ssh_keys.sh "$1"

	SSH_ARG="$USER@$(ipv4_addr "$1")"
	SSH_ARGS=(ssh -o "StrictHostKeyChecking=no" "$SSH_ARG")

	"${SSH_ARGS[@]}" "rm -f ~/bootstrap.sh"

	if [ -z "$3" ]; then
		BRANCH=master
	else
		BRANCH=$3
	fi

	ORG=project-81
	REPO=workspace
	URL_BASE=https://raw.githubusercontent.com/$ORG/$REPO/$BRANCH

	# Prompt for sudo password.
	read -s -r -p "Password for sudo: " SUDO_PASS
	"${SSH_ARGS[@]}" "touch ~/password.txt"
	"${SSH_ARGS[@]}" "chmod 600 ~/password.txt"
	"${SSH_ARGS[@]}" "echo $SUDO_PASS >> ~/password.txt"

	# Run these bootstrapping scripts in order.
	SCRIPTS=("scripts/$2/bootstrap.sh")
	SCRIPTS+=("scripts/bootstrap_common.sh")

	for SCRIPT in "${SCRIPTS[@]}"; do
		set -x

		# shellcheck disable=SC2029
		"${SSH_ARGS[@]}" "curl $URL_BASE/$SCRIPT -so ~/tmp.sh" || \
			"${SSH_ARGS[@]}" \
			"wget --no-cache -q -O ~/tmp.sh $URL_BASE/$SCRIPT"

		set +x

		# Run the bootstrapping script.
		echo "Starting bootstrapping for '$SCRIPT'."
		time "${SSH_ARGS[@]}" "sh ~/tmp.sh"
		echo "Completed '$SCRIPT' bootstrapping."
		"${SSH_ARGS[@]}" "rm -f ~/tmp.sh"
	done

	"${SSH_ARGS[@]}" "rm ~/password.txt"

	echo "Provisioning succeeded!"
}
