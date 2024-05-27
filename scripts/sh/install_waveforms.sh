safe_pushd ~/tmp

HOST=https://digilent.s3.us-west-2.amazonaws.com/Software

ARCH=amd64
if is_rpi; then
	ARCH=armhf
fi

ADEPT_VERSION=2.27.9

FILE=digilent.adept.runtime_$ADEPT_VERSION-$ARCH.deb

install_package_if_not wget

install_package libqt5serialport5 \
	libqt5network5 \
	libqt5scripttools5 \
	libqt5multimedia5-plugins

if [ ! -f $FILE ]; then
	wget $HOST/Adept2+Runtime/$ADEPT_VERSION/$FILE
	sudo_cmd dpkg -i $FILE
fi

WAVEFORMS_VERSION=3.22.2

FILE=digilent.waveforms_${WAVEFORMS_VERSION}_$ARCH.deb

if [ ! -f $FILE ]; then
	wget $HOST/Waveforms2015/$WAVEFORMS_VERSION/$FILE
	sudo_cmd dpkg -i $FILE
fi

safe_popd
