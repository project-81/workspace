run_install dosfstools-src

PROJECT=circuitpython

clone_third_party_github_no_update adafruit $PROJECT
safe_pushd "$THIRD_PARTY/$PROJECT"

make fetch-submodules

pre-commit install

pip_install -r requirements-dev.txt

run_make -C mpy-cross

for PORT in raspberrypi atmel-samd stm; do
	safe_pushd ports/$PORT
	run_make
	safe_popd
done

safe_popd
