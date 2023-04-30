#!/bin/bash

if is_opensuse; then
	# Install Go.
	test "$GO_VERSION"
	install_package "go$GO_VERSION"
	go version

	# Install bazelisk.
	go install github.com/bazelbuild/bazelisk@latest
else
	if is_cmd go; then
		return
	fi

	# Need 'wget' to download release.
	if ! is_cmd wget; then
		install_package wget
	fi

	# This is used for downloading pre-built releases.
	[ "$GO_FULL_VERSION" ] || export GO_FULL_VERSION=$GO_VERSION.3

	# Determine which variant to download.
	VARIANT=""
	case $(uname -m) in
		aarch64)
			VARIANT=arm64
			;;
		armv6l)
			VARIANT=armv6l
			;;
	esac

	if [ "$VARIANT" ]; then
		GO_RELEASE=go$GO_FULL_VERSION.linux-$VARIANT.tar.gz
		GO_URL=https://go.dev/dl/$GO_RELEASE
		echo "$GO_URL"

		safe_pushd "$THIRD_PARTY"

		if [ ! -f "$GO_RELEASE" ]; then
			wget "$GO_URL"
		fi

		if [ ! -d go ]; then
			tar xvf "$GO_RELEASE"
		fi

		safe_popd

		# Install binaries.
		install_local_bin go/bin/go
		install_local_bin go/bin/gofmt
	fi
fi
