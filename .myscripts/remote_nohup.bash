#!/bin/bash
set -euo pipefail
export LC_ALL=C
export LANG=C

HOST=$1

GIT_DIR=$(git rev-parse --show-toplevel)
PROJECT_NAME=$(basename $GIT_DIR)

~/.myscripts/myrsync.bash $HOST

args=()
for arg in "${@:2}"; do
  args+=("\"${arg}\"")
done

ssh -o LogLevel=QUIET -t $HOST "
  set -euo pipefail
  export LC_ALL=C
  export LANG=C

  TMP_STDOUT=\$(mktemp)
  cd \${HOME}/${PROJECT_NAME}
  trap \"rm -f \$TMP_STDOUT\" EXIT
  nohup ${args[@]} > \$TMP_STDOUT 2>&1 &
  tail -f --pid=\$! \$TMP_STDOUT
  "
