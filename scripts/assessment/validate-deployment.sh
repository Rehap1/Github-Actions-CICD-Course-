#!/usr/bin/env bash
set -Eeuo pipefail

BASE_URL="${1:-}"
EXIT_CODE=0
HEALTH_BODY=""

if [[ -z "${BASE_URL}" ]]; then
  echo "Usage: bash scripts/assessment/validate-deployment.sh http://<host>:8000"
  exit 1
fi

if ! command -v curl >/dev/null 2>&1; then
  echo "curl is required to validate the deployment."
  exit 1
fi

if ! command -v jq >/dev/null 2>&1; then
  echo "jq is required to validate the JSON fields returned by /version and /status."
  echo "Install jq first, then run this script again."
  exit 1
fi

BASE_URL="${BASE_URL%/}"
VERSION_BODY=""
STATUS_BODY=""

print_header() {
  printf '\n==> %s\n' "$1" >&2
}

pass() {
  printf '[PASS] %s\n' "$1" >&2
}

fail() {
  printf '[FAIL] %s\n' "$1" >&2
  EXIT_CODE=1
}

fetch_endpoint_body() {
  local name="$1"
  local path="$2"
  local body

  printf 'Checking %s%s\n' "${BASE_URL}" "${path}" >&2

  if ! body="$(curl --fail --silent --show-error "${BASE_URL}${path}")"; then
    fail "${name} did not respond successfully."
    return 1
  fi

  printf '%s\n\n' "${body}" >&2
  pass "${name} responded successfully."

  printf '%s' "${body}"
}

require_json_object() {
  local payload="$1"
  local endpoint_name="$2"

  if jq -e 'type == "object"' >/dev/null 2>&1 <<<"${payload}"; then
    pass "${endpoint_name} returned JSON."
    return 0
  fi

  fail "${endpoint_name} did not return valid JSON."
  return 1
}

require_json_key() {
  local payload="$1"
  local key="$2"
  local endpoint_name="$3"

  if jq -e --arg key "${key}" 'has($key) and .[$key] != null and .[$key] != ""' >/dev/null 2>&1 <<<"${payload}"; then
    local value
    value="$(jq -r --arg key "${key}" '.[$key]' <<<"${payload}")"
    pass "${endpoint_name} includes ${key}: ${value}"
  else
    fail "${endpoint_name} is missing required key ${key}"
  fi
}

require_json_value() {
  local payload="$1"
  local key="$2"
  local expected="$3"
  local endpoint_name="$4"

  if jq -e --arg key "${key}" --arg expected "${expected}" 'has($key) and .[$key] == $expected' >/dev/null 2>&1 <<<"${payload}"; then
    pass "${endpoint_name} includes ${key}: ${expected}"
  else
    fail "${endpoint_name} does not include ${key}: ${expected}"
  fi
}

print_header "Checking HTTP endpoints"

if ! HEALTH_BODY="$(fetch_endpoint_body "/health" "/health")"; then
  echo "Deployment validation stopped because /health did not respond successfully." >&2
  exit 1
fi

if ! VERSION_BODY="$(fetch_endpoint_body "/version" "/version")"; then
  echo "Deployment validation stopped because /version did not respond successfully." >&2
  exit 1
fi

if ! STATUS_BODY="$(fetch_endpoint_body "/status" "/status")"; then
  echo "Deployment validation stopped because /status did not respond successfully." >&2
  exit 1
fi

print_header "Checking required JSON fields"

if require_json_object "${HEALTH_BODY}" "/health"; then
  require_json_value "${HEALTH_BODY}" "status" "ok" "/health"
fi

if require_json_object "${VERSION_BODY}" "/version"; then
  require_json_key "${VERSION_BODY}" "app_version" "/version"
  require_json_key "${VERSION_BODY}" "commit_sha" "/version"
  require_json_key "${VERSION_BODY}" "image_tag" "/version"
fi

if require_json_object "${STATUS_BODY}" "/status"; then
  require_json_value "${STATUS_BODY}" "status" "ok" "/status"
  require_json_key "${STATUS_BODY}" "app_version" "/status"
  require_json_key "${STATUS_BODY}" "commit_sha" "/status"
  require_json_key "${STATUS_BODY}" "image_tag" "/status"
  require_json_key "${STATUS_BODY}" "environment" "/status"
  require_json_key "${STATUS_BODY}" "deployment_mode" "/status"
fi

echo >&2

if [[ "${EXIT_CODE}" -eq 0 ]]; then
  echo "Deployment validation completed successfully." >&2
else
  echo "Deployment validation found one or more problems." >&2
fi

exit "${EXIT_CODE}"
