# Install Go.
test "$GO_VERSION"
install_package go$GO_VERSION
go version

# Install bazelisk.
go install github.com/bazelbuild/bazelisk@latest
