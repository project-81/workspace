sudo apt-get update && sudo apt-get upgrade -y

TASKS+=(python rcmpy)

if is_rpi; then
	echo "is pi"
fi
