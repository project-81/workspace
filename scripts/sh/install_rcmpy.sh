# Install rcmpy.
pip install --user rcmpy
rcmpy --version

# Update rcmpy.
rcmpy use "$REPO/config/rcmpy"
rcmpy variant "$USER"
rcmpy apply
