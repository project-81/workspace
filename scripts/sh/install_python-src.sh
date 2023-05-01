# Need 'wget' to download release.
install_package_if_not wget

# This is used for downloading pre-built releases.
[ "$PYTHON_FULL_VERSION" ] || export PYTHON_FULL_VERSION=$PYTHON_VERSION.3

PYTHON_SRC_ARCHIVE="v$PYTHON_FULL_VERSION.tar.gz"
PYTHON_SRC="cpython-$PYTHON_FULL_VERSION"

safe_pushd "$THIRD_PARTY"

if [ ! -f "$PYTHON_SRC_ARCHIVE" ]; then
	wget "https://github.com/python/cpython/archive/refs/tags/$PYTHON_SRC_ARCHIVE"
fi

if [ ! -d "$PYTHON_SRC" ]; then
	tar xvf "$PYTHON_SRC_ARCHIVE"
fi

safe_pushd "$PYTHON_SRC"

./configure "$PREFIX_ARG" --enable-optimizations --with-lto=yes
make "-j$(nproc)"
make install

safe_popd

safe_popd
