# Install Python.
test "$PYTHON_VERSION"

if ! is_cmd pip; then
	if is_opensuse; then
		for PKG in base pip; do
			install_package "python${PYTHON_VERSION/./}-$PKG"
		done
	elif is_debian || is_ubuntu; then
		install_package python3-pip
	fi
fi

if is_debian || is_ubuntu; then
	install_package python3-venv
fi

# Create a virtual environment.
test "$VENV"
if [ ! -d "$VENV" ]; then
	"python$PYTHON_VERSION" -m venv "$VENV"
	"$VENV/bin/pip" install --upgrade pip
fi

if [ ! -L "$HOME/venv" ]; then
	ln -s "$VENV" "$HOME/venv"
fi

add_if_not "$HOME/venv/bin"

# Install packages.
pip --version
pip_install --upgrade -r "$SCRIPTS/python_requirements.txt"
