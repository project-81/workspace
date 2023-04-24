set -e

if [ -z "$REPO" ] || [ ! -d "$REPO" ]; then
	echo "REPO not set to a real directory: '$REPO'!"
	exit 1
fi

SCRIPTS="$REPO/scripts"
THIRD_PARTY="$HOME/third-party"

INSTALL_PREFIX="$HOME/.local"
mkdir -p "$INSTALL_PREFIX"

. "$SCRIPTS/functions.sh"
. "$SCRIPTS/variables.sh"
