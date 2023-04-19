# Install Python.
test "$PYTHON_VERSION"
sudo zypper install -y "python${PYTHON_VERSION/./}-base"
sudo zypper install -y "python${PYTHON_VERSION/./}-pip"
