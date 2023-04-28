set -e

if [ -z "$REPO" ] || [ ! -d "$REPO" ]; then
	echo "REPO not set to a real directory: '$REPO'!"
	exit 1
fi

SCRIPTS="$REPO/scripts"
THIRD_PARTY="$HOME/third-party"

INSTALL_PREFIX="$HOME/.local"
mkdir -p "$INSTALL_PREFIX"

PREFIX_ARG="--prefix=$INSTALL_PREFIX"
test "$PREFIX_ARG"

. "$SCRIPTS/functions.sh"

. "$SCRIPTS/platform_functions.sh"
. "$SCRIPTS/install_functions.sh"
. "$SCRIPTS/git_functions.sh"
. "$SCRIPTS/networking_functions.sh"

. "$SCRIPTS/variables.sh"
