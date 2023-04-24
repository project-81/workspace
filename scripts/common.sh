set -e

if [ -z "$REPO" ] || [ ! -d "$REPO" ]; then
	echo "REPO not set to a real directory: '$REPO'!"
	exit 1
fi

export SCRIPTS="$REPO/scripts"
export THIRD_PARTY="$HOME/third-party"

. "$SCRIPTS/functions.sh"
. "$SCRIPTS/variables.sh"
