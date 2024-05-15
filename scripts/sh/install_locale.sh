export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US

if is_rpi; then
	sudo_cmd perl -pi -e \
		's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
fi

sudo_cmd locale-gen "$LANG"
sudo_cmd update-locale
