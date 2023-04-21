# Install Python.
test "$PYTHON_VERSION"
for PKG in base pip; do
	install_package "python${PYTHON_VERSION/./}-$PKG"
done

# Install packages.
pip install --user --upgrade -r "$SCRIPTS/python_requirements.txt"
