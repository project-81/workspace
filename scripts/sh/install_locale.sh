[ "$LANG" ] || export LANG=en_US.UTF-8
sudo_cmd locale-gen "$LANG"
sudo update-locale
