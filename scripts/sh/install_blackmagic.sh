PROJECT=blackmagic
clone_third_party_github $PROJECT-debug $PROJECT
safe_pushd "$THIRD_PARTY/$PROJECT"

if [ ! -f "$HOME/bin/$PROJECT" ]; then

	if is_debian; then
		install_udev_rule driver/99-blackmagic-plugdev.rules
		install_package libftdi1-dev
		install_package libhidapi-dev
	fi

	make PROBE_HOST=hosted "-j$(nproc)"
	cp ./src/$PROJECT "$HOME/bin/"

fi

safe_popd
