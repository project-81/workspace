if ! is_cmd meson; then
	run_install python
fi

meson --version

PROJECT=tio

clone_third_party_github $PROJECT $PROJECT
safe_pushd "$THIRD_PARTY/$PROJECT"

meson setup --prefix "$INSTALL_PREFIX" build
meson compile -C build
meson install -C build

safe_popd
