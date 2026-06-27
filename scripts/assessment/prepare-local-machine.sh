#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_SCRIPT="${SCRIPT_DIR}/../install-assessment-deps.sh"

if [[ $# -eq 0 ]]; then
  exec bash "${ROOT_SCRIPT}" --check-only
fi

exec bash "${ROOT_SCRIPT}" "$@"
