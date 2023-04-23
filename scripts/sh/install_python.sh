# Install Python.
test "$PYTHON_VERSION"

if is_opensuse; then
	for PKG in base pip; do
		install_package "python${PYTHON_VERSION/./}-$PKG"
	done
elif is_debian; then
	install_package python3-pip
fi

# Install packages.
pip --version
pip install --user --upgrade -r "$SCRIPTS/python_requirements.txt"
