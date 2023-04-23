sudo apt-get update && sudo apt-get upgrade -y

git version

TASKS+=(git python neovim rcmpy)

if is_rpi; then
	echo "is pi"
fi
