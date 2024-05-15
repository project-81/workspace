export PYTHON_VERSION=3.12

[ "$GO_VERSION" ] || export GO_VERSION=1.20

VENV="$HOME/venv$PYTHON_VERSION"
test "$VENV"

UDEV_DEST=/usr/lib/udev/rules.d
test $UDEV_DEST

HOST_ARCH=$(uname -m)
test "$HOST_ARCH"

# Better place to declare this?
PKG_CONFIG_PATH="/usr/lib/$HOST_ARCH-linux-gnu/pkgconfig"
PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/share/pkgconfig"
export PKG_CONFIG_PATH
