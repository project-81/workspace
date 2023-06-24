PROJECT=autoconf

if is_cmd $PROJECT; then
	return
fi

VERSION=2.71
ARCHIVE=$PROJECT-$VERSION.tar.xz

safe_pushd "$THIRD_PARTY"

if [ ! -f $ARCHIVE ]; then
	wget http://ftp.gnu.org/gnu/$PROJECT/$ARCHIVE
fi

if [ ! -d $PROJECT-$VERSION ]; then
	tar xvf $ARCHIVE
fi

safe_pushd "$PROJECT-$VERSION"

./configure "$PREFIX_ARG"
run_make
make install

safe_popd

safe_popd
