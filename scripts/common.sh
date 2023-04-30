set -e

# shellcheck disable=SC2153
if [ -z "$REPO" ] || [ ! -d "$REPO" ]; then
	echo "REPO not set to a real directory: '$REPO'!"
	exit 1
fi

SCRIPTS="$REPO/scripts"
THIRD_PARTY="$HOME/third-party"
mkdir -p "$THIRD_PARTY"

INSTALL_PREFIX="$HOME/.local"
mkdir -p "$INSTALL_PREFIX"

# Create the 'autoload' directory if necessary.
VIM_AUTOLOAD="$HOME/.vim/autoload"
mkdir -p "$VIM_AUTOLOAD"
VIM_PLUG="$HOME/.vim/plugged"
mkdir -p "$VIM_PLUG"

PREFIX_ARG="--prefix=$INSTALL_PREFIX"
test "$PREFIX_ARG"

# shellcheck source=./functions.sh
. "$SCRIPTS/functions.sh"

# shellcheck source=./platform_functions.sh
. "$SCRIPTS/platform_functions.sh"

# shellcheck source=./install_functions.sh
. "$SCRIPTS/install_functions.sh"

# shellcheck source=./git_functions.sh
. "$SCRIPTS/git_functions.sh"

# shellcheck source=./networking_functions.sh
. "$SCRIPTS/networking_functions.sh"

# shellcheck source=./variables.sh
. "$SCRIPTS/variables.sh"
