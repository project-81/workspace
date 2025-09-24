#!/bin/bash

# Install Python.

if ! is_cmd pip; then
	if is_opensuse; then
		# Fall back on source build.
		# for PKG in base pip devel; do
		# 	install_package "python${PYTHON_VERSION/./}-$PKG"
		# done
		true
	elif is_debian || is_ubuntu; then
		install_package python3-pip
	fi
fi

source_install_python() {
	run_install_if_not "python$PYTHON_VERSION" python-src
}

if is_rpi; then
	source_install_python
elif is_debian || is_ubuntu; then
	install_package python3-venv \
		"python$PYTHON_VERSION" \
		"python$PYTHON_VERSION-venv" || source_install_python
else
	source_install_python
fi

# Create a virtual environment.
test "$VENV"
if [ ! -d "$VENV" ]; then
	time_if "python$PYTHON_VERSION" -m venv "$VENV"
	time_if "$VENV/bin/pip" install --upgrade pip
fi

# Always re-create the symbolic link.
rm -f "$HOME/venv"

if [ ! -L "$HOME/venv" ]; then
	# Try removing it if it's a directory (it shouldn't be).
	rm -rf "$HOME/venv"
	ln -s "$VENV" "$HOME/venv"
fi

add_if_not "$HOME/venv/bin"

# Install packages.
"$HOME/venv/bin/pip" --version
"$HOME/venv/bin/pip" install --upgrade -r "$SCRIPTS/python_requirements.txt"
