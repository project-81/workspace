# Initialization tasks.

if is_wsl; then
	# https://github.com/tmux/tmux/issues/1092
	sudo systemd-tmpfiles --create
fi
