#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_SCRIPT="${SCRIPT_DIR}/../install-assessment-deps.sh"

if [[ $# -gt 0 && "${1}" != --* ]]; then
  TARGET_USER="$1"
  shift
  exec bash "${ROOT_SCRIPT}" --target-user "${TARGET_USER}" "$@"
fi

exec bash "${ROOT_SCRIPT}" "$@"
