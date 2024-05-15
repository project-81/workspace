export LANGUAGE=en_US
export LC_ALL=$LANGUAGE.UTF-8
export LANG=$LANGUAGE.UTF-8

# https://www.jaredwolff.com/raspberry-pi-setting-your-locale/
if is_rpi; then
	sudo_cmd perl -pi -e \
		's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
fi

sudo_cmd locale-gen "$LANG"
sudo_cmd update-locale
