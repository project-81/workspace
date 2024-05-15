export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US

sudo_cmd locale-gen "$LANG"
sudo_cmd update-locale
