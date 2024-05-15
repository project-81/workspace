BASE_URL=https://developer.arm.com/-/media/Files/downloads/gnu

GCC_VERSION=12.2
VARIANT=mpacbti-rel1
TOOLCHAIN=arm-none-eabi

DIRECTORY=arm-gnu-toolchain-$GCC_VERSION.$VARIANT-$HOST_ARCH-$TOOLCHAIN
ARCHIVE=$DIRECTORY.tar.xz

safe_pushd "$THIRD_PARTY"

if [ ! -f "$ARCHIVE" ]; then
	wget "$BASE_URL/$GCC_VERSION.$VARIANT/binrel/$ARCHIVE"
fi

if [ ! -d "$DIRECTORY" ]; then
	tar xvf "$ARCHIVE"
fi

if [ ! -L $TOOLCHAIN ]; then
	ln -s "$DIRECTORY" $TOOLCHAIN
fi
add_front_if_not $TOOLCHAIN/bin

safe_popd
