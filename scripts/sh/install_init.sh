# Initialization tasks.

if is_wsl; then
	# https://github.com/tmux/tmux/issues/1092
	sudo systemd-tmpfiles --create

	# https://github.com/microsoft/WSL/discussions/8484
	install_package libcap-progs
	sudo setcap cap_net_raw=p /usr/bin/ping
fi
