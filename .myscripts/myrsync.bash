#!/bin/bash
set -euo pipefail
export LC_ALL=C
export LANG=C

HOST=$1

GIT_DIR=$(git rev-parse --show-toplevel)
PROJECT_NAME=$(basename $GIT_DIR)
rsync -avh --delete --exclude='.git' --exclude='results' --include='myscripts' --filter=":- ${GIT_DIR}/.gitignore" --filter=":- ${HOME}/.gitignore_global" --filter '-_.nfs*' -e ssh ${GIT_DIR}/ ${HOST}:\${HOME}/${PROJECT_NAME}
