PROJECT=micropython

clone_third_party_github $PROJECT $PROJECT

safe_pushd "$THIRD_PARTY/$PROJECT"

safe_pushd mpy-cross
run_make
safe_popd

safe_pushd ports/rp2
# Note, need 'BOARD=PICO_W' etc. if not using standard Pico.
make submodules
run_make CMAKE_GENERATOR="Unix Makefiles"
safe_popd

safe_popd

clone_third_party_github $PROJECT $PROJECT-lib
