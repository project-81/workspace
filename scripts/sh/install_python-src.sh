# Need 'wget' to download release.
install_package_if_not wget

# Install system dependencies.
if is_opensuse; then
	install_package \
		libffi-devel \
		sqlite3-devel \
		ncurses-devel \
		libreadline8 \
		libbluetooth3 \
		libarchive-devel \
		libopenssl-devel \
		tcl-devel \
		tk-devel \
		libbz2-devel \
		uuid-devel
elif is_debian || is_ubuntu; then
	install_package \
		libffi-dev \
		libsqlite3-dev \
		libncurses-dev \
		libreadline-dev \
		libbluetooth-dev \
		libarchive-dev \
		libssl-dev \
		tcl-dev \
		tk-dev \
		libbz2-dev \
		lzma \
		lzma-dev \
		liblzma-dev \
		uuid-dev \
		libgdbm-dev \
		libgdbm-compat-dev
fi

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
run_make

# lists modules / prints missing
./python ./setup.py build -n

make install

safe_popd

safe_popd
