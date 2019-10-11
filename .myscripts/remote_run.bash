#!/bin/bash
set -euo pipefail
export LC_ALL=C
export LANG=C

HOST=$1

GIT_DIR=$(git rev-parse --show-toplevel)
PROJECT_NAME=$(basename $GIT_DIR)

args=()
for arg in "${@:2}"; do
  args+=("\"${arg}\"")
done

ssh $HOST "cd \${HOME}/${PROJECT_NAME} && ${args[@]}"
