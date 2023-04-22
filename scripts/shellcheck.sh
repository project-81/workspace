#!/bin/bash

REPO=$(git rev-parse --show-toplevel)

# shellcheck source=common.sh
. "$REPO/scripts/common.sh"

pushd "$SCRIPTS" >/dev/null || exit

FILES=$(find . -type f)
for file in $FILES
do
	shellcheck -s bash -x -f gcc "$file"
done

popd >/dev/null || exit
