PROJECT=tio

if is_local_bin $PROJECT; then
	return
fi

if ! is_cmd meson; then
	run_install python
fi

meson --version

clone_third_party_github $PROJECT $PROJECT
safe_pushd "$THIRD_PARTY/$PROJECT"

install_package libglib2.0-dev
sudo_cmd ldconfig

meson setup --prefix "$INSTALL_PREFIX" build
meson compile -C build
meson install -C build

safe_popd
