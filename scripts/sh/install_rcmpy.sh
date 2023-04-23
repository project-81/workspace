# Find the script, if our PATH isn't updated yet that's okay.
RCMPY=rcmpy
if ! is_cmd $RCMPY; then
	RCMPY=~/.local/bin/$RCMPY
fi

# Package should be installed via requirements file.
$RCMPY --version

# Update rcmpy.
$RCMPY use "$REPO/config/rcmpy"
$RCMPY variant "$USER"
$RCMPY apply
