if is_rpi; then
	export PYTHON_VERSION=3.9
else
	export PYTHON_VERSION=3.11
fi

[ "$GO_VERSION" ] || export GO_VERSION=1.20

VENV="$HOME/venv$PYTHON_VERSION"
test "$VENV"

UDEV_DEST=/usr/lib/udev/rules.d
test $UDEV_DEST
