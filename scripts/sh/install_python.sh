# Install Python.
test "$PYTHON_VERSION"
for PKG in base pip; do
	install_package "python${PYTHON_VERSION/./}-$PKG"
done
