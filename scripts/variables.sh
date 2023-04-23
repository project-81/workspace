if [ -z "$PYTHON_VERSION" ]; then
	if is_rpi; then
		export PYTHON_VERSION=3.9
	else
		export PYTHON_VERSION=3.11
	fi
fi
[ "$GO_VERSION" ] || export GO_VERSION=1.20
