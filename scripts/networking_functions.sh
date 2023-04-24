poke_ssh() {
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
}

attempt_ping() {
	ping -c 1 "$1" >/dev/null
}

await_pingable() {
	local PING_COUNT
	PING_COUNT=0
	while ! attempt_ping "$1"; do
		echo "Ping attempt '$1' $PING_COUNT."
		((PING_COUNT++)) || true
	done

	echo "'$1' responded to ping."
}

ipv4_addr() {
	getent ahostsv4 "$1" | sed -n 's/ *STREAM.*//p'
}
