# Package should be installed via requirements file.
rcmpy --version

# Update rcmpy.
rcmpy use "$REPO/config/rcmpy"
rcmpy variant "$USER"
rcmpy apply
