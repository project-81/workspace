export PYTHON_VERSION=3.11

[ "$GO_VERSION" ] || export GO_VERSION=1.2

VENV="$HOME/venv$PYTHON_VERSION"
test "$VENV"

UDEV_DEST=/usr/lib/udev/rules.d
test $UDEV_DEST
