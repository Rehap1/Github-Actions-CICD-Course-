#!/usr/bin/env bash
set -Eeuo pipefail

CHECK_ONLY=0
CONFIGURE_FIREWALL=0
TARGET_USER="${SUDO_USER:-${USER:-ubuntu}}"
SUPPORTED_UBUNTU_VERSIONS=("20.04" "22.04" "24.04")
NEEDS_DOCKER_RELOGIN=0
EXIT_CODE=0

declare -A STATUS=()
declare -A DETAILS=()
declare -a SUMMARY_ORDER=()

usage() {
  cat <<EOF
Usage:
  sudo bash scripts/install-assessment-deps.sh [--target-user <user>]
  bash scripts/install-assessment-deps.sh --check-only [--target-user <user>]
  sudo bash scripts/install-assessment-deps.sh --configure-firewall [--target-user <user>]

What this script does:
  - installs the Ubuntu packages needed for the final assessment
  - validates the tools the course depends on
  - checks Docker daemon readiness and Docker group access
  - checks whether port 8000 is already in use

Useful flags:
  --check-only         Validate the current machine without installing packages
  --configure-firewall Add ufw rules for ports 22 and 8000 if ufw is installed
  --target-user USER   User that should be able to run docker without sudo
  --help               Show this message
EOF
}

print_header() {
  printf '\n==> %s\n' "$1"
}

record_status() {
  local key="$1"
  local state="$2"
  local detail="$3"

  if [[ -z "${STATUS[$key]+x}" ]]; then
    SUMMARY_ORDER+=("$key")
  fi

  STATUS["$key"]="$state"
  DETAILS["$key"]="$detail"

  case "$state" in
    PASS) printf '[PASS] %s\n' "$detail" ;;
    WARN) printf '[WARN] %s\n' "$detail" ;;
    FAIL) printf '[FAIL] %s\n' "$detail" ; EXIT_CODE=1 ;;
  esac
}

mark_pass() {
  record_status "$1" "PASS" "$2"
}

mark_warn() {
  record_status "$1" "WARN" "$2"
}

mark_fail() {
  record_status "$1" "FAIL" "$2"
}

print_summary() {
  printf '\n==> Summary\n'
  printf '%-28s %-6s %s\n' "Check" "State" "Details"
  printf '%-28s %-6s %s\n' "-----" "-----" "-------"

  local key
  for key in "${SUMMARY_ORDER[@]}"; do
    printf '%-28s %-6s %s\n' "$key" "${STATUS[$key]}" "${DETAILS[$key]}"
  done

  if [[ "${NEEDS_DOCKER_RELOGIN}" -eq 1 ]]; then
    printf '\nNext step: sign out and sign back in once so Docker group access applies to %s.\n' "${TARGET_USER}"
  fi

  printf '\n==> Next steps\n'

  if [[ "${EXIT_CODE}" -eq 0 ]]; then
    printf -- '- If the critical checks above passed, continue with docs/setup/04-prepare-assessment-vm.md.\n'
  else
    printf -- '- Fix the FAIL items above before you continue to LAB-07 or EX-11.\n'
  fi

  if [[ "${CONFIGURE_FIREWALL}" -eq 0 ]]; then
    printf -- '- This script did not change firewall rules. Confirm SSH and port 8000 access in your VM or cloud network settings.\n'
  fi

  if [[ "${NEEDS_DOCKER_RELOGIN}" -eq 1 ]]; then
    printf -- '- After you sign in again, rerun this script with --check-only if you want one more confirmation pass.\n'
  fi
}

on_error() {
  local line_number="$1"
  mark_fail "Unexpected error" "The script stopped unexpectedly near line ${line_number}."
  print_summary
  exit 1
}

trap 'on_error "${LINENO}"' ERR

while [[ $# -gt 0 ]]; do
  case "$1" in
    --check-only)
      CHECK_ONLY=1
      shift
      ;;
    --configure-firewall)
      CONFIGURE_FIREWALL=1
      shift
      ;;
    --target-user)
      if [[ $# -lt 2 ]]; then
        printf 'Missing value for --target-user.\n' >&2
        usage
        exit 1
      fi
      TARGET_USER="$2"
      shift 2
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      printf 'Unknown argument: %s\n\n' "$1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ "${CHECK_ONLY}" -eq 1 && "${CONFIGURE_FIREWALL}" -eq 1 ]]; then
  printf 'Do not combine --check-only with --configure-firewall.\n' >&2
  exit 1
fi

print_plan() {
  print_header "What this script will do"

  echo "This script is for the later Ubuntu VM assessment path."

  if [[ "${CHECK_ONLY}" -eq 1 ]]; then
    echo "- It will only validate the current machine."
    echo "- It will not install packages or change system settings."
  else
    echo "- It will install only the assessment tools that are missing."
    echo "- It will try to start Docker if Docker is installed but not active."
    echo "- It may add ${TARGET_USER} to the docker group if needed."
  fi

  if [[ "${CONFIGURE_FIREWALL}" -eq 1 ]]; then
    echo "- It will try to add ufw rules for ports 22 and 8000 if ufw is installed."
  else
    echo "- It will not change firewall rules unless you explicitly pass --configure-firewall."
  fi
}

detect_ubuntu() {
  print_header "Checking operating system"

  if [[ ! -r /etc/os-release ]]; then
    mark_fail "Ubuntu release" "Could not read /etc/os-release. This script supports Ubuntu only."
    print_summary
    exit 1
  fi

  # shellcheck disable=SC1091
  source /etc/os-release

  if [[ "${ID:-}" != "ubuntu" ]]; then
    mark_fail "Ubuntu release" "Detected ${ID:-unknown}. This script supports Ubuntu only."
    print_summary
    exit 1
  fi

  local version_supported=0
  local supported_version
  for supported_version in "${SUPPORTED_UBUNTU_VERSIONS[@]}"; do
    if [[ "${VERSION_ID:-}" == "${supported_version}" ]]; then
      version_supported=1
      break
    fi
  done

  if [[ "${version_supported}" -ne 1 ]]; then
    mark_fail "Ubuntu release" "Ubuntu ${VERSION_ID:-unknown} is not in the supported list (${SUPPORTED_UBUNTU_VERSIONS[*]})."
    print_summary
    exit 1
  fi

  mark_pass "Ubuntu release" "Ubuntu ${VERSION_ID} (${VERSION_CODENAME:-${UBUNTU_CODENAME:-unknown}}) is supported."
}

require_root_for_install() {
  if [[ "${CHECK_ONLY}" -eq 0 && "${EUID}" -ne 0 ]]; then
    mark_fail "Privileges" "Run this script with sudo to install packages, or use --check-only to validate only."
    print_summary
    exit 1
  fi

  if [[ "${CHECK_ONLY}" -eq 1 ]]; then
    mark_pass "Mode" "Running in check-only mode. No packages will be installed."
  else
    mark_pass "Mode" "Running in install-and-check mode for target user ${TARGET_USER}."
  fi
}

install_packages() {
  if [[ "${CHECK_ONLY}" -eq 1 ]]; then
    return
  fi

  print_header "Installing assessment dependencies"

  export DEBIAN_FRONTEND=noninteractive

  local -a packages=(
    # Git is needed for repository and branch visibility during the assessment.
    git
    # SSH tools are needed to reach the Ubuntu VM.
    openssh-client
    # curl and wget are used for smoke tests and quick downloads.
    curl
    wget
    # unzip helps when students or instructors need to unpack small utilities.
    unzip
    # Certificates and GPG support HTTPS package access and signed repository metadata.
    ca-certificates
    gnupg
    # lsb-release helps with Ubuntu version reporting during setup support.
    lsb-release
    # jq is useful when reading JSON responses from the sample app.
    jq
    # Python 3 is needed to run the tiny app and basic validation utilities.
    python3
    # Docker is the standardized deployment model for the final assessment.
    docker.io
    # Common networking/debug tools help students troubleshoot quickly.
    iproute2
    iputils-ping
    netcat-openbsd
  )

  if apt-get update >/dev/null; then
    mark_pass "apt update" "Package index refreshed successfully."
  else
    mark_fail "apt update" "apt-get update failed. Check network access and Ubuntu package sources."
  fi

  local -a already_present=()
  local -a missing_packages=()
  local package

  for package in "${packages[@]}"; do
    if dpkg-query -W -f='${Status}' "${package}" 2>/dev/null | grep -q "install ok installed"; then
      already_present+=("${package}")
    else
      missing_packages+=("${package}")
    fi
  done

  if [[ "${#already_present[@]}" -gt 0 ]]; then
    mark_pass "Already present" "Already installed: ${already_present[*]}"
  else
    mark_pass "Already present" "No assessment packages were already installed on this machine."
  fi

  if [[ "${#missing_packages[@]}" -eq 0 ]]; then
    mark_pass "Installed packages" "All required assessment packages were already present. No installation was needed."
  elif apt-get install -y --no-install-recommends "${missing_packages[@]}" >/dev/null; then
    mark_pass "Installed packages" "Installed the missing assessment packages: ${missing_packages[*]}"
  else
    mark_fail "Installed packages" "One or more required assessment packages could not be installed."
  fi

  if apt-cache show docker-compose-plugin >/dev/null 2>&1; then
    if dpkg-query -W -f='${Status}' docker-compose-plugin 2>/dev/null | grep -q "install ok installed"; then
      mark_pass "Docker Compose plugin" "docker compose plugin is already installed."
    else
      mark_warn "Docker Compose plugin" "docker compose plugin is optional and is not installed. The current assessment does not require it."
    fi
  else
    mark_warn "Docker Compose plugin" "docker-compose-plugin is not available in this Ubuntu package source. The current assessment does not require it."
  fi
}

ensure_docker_service() {
  print_header "Checking Docker service"

  if ! command -v docker >/dev/null 2>&1; then
    mark_fail "Docker CLI" "docker command is not available."
    return
  fi

  mark_pass "Docker CLI" "$(docker --version 2>&1 | head -n 1)"

  if ! command -v systemctl >/dev/null 2>&1; then
    mark_fail "Docker daemon" "systemctl is not available, so Docker daemon state cannot be managed cleanly on this Ubuntu machine."
    return
  fi

  if systemctl is-active --quiet docker; then
    mark_pass "Docker daemon" "Docker service is active."
    return
  fi

  if [[ "${CHECK_ONLY}" -eq 0 ]]; then
    if systemctl enable --now docker >/dev/null 2>&1; then
      mark_pass "Docker daemon" "Docker service was started successfully."
      return
    fi
  else
    mark_fail "Docker daemon" "Docker service is not active. Run 'sudo systemctl status docker' on the machine to inspect it."
    return
  fi

  mark_fail "Docker daemon" "Docker service could not be started. Run 'sudo systemctl status docker' on the machine to inspect it."
}

ensure_docker_group_access() {
  print_header "Checking Docker access"

  if ! getent passwd "${TARGET_USER}" >/dev/null 2>&1; then
    mark_warn "Docker user access" "Target user ${TARGET_USER} does not exist on this machine. Skipping docker group setup."
    return
  fi

  if id -nG "${TARGET_USER}" | grep -qw docker; then
    if [[ "${CHECK_ONLY}" -eq 1 && "${TARGET_USER}" == "${USER:-}" ]]; then
      if docker info >/dev/null 2>&1; then
        mark_pass "Docker user access" "User ${TARGET_USER} can run docker without sudo."
      else
        mark_warn "Docker user access" "User ${TARGET_USER} is in the docker group, but the current shell still cannot run docker. A new login may be needed."
      fi
    else
      mark_pass "Docker user access" "User ${TARGET_USER} is in the docker group."
    fi
    return
  fi

  if [[ "${CHECK_ONLY}" -eq 0 ]]; then
    usermod -aG docker "${TARGET_USER}"
    NEEDS_DOCKER_RELOGIN=1
    mark_warn "Docker user access" "Added ${TARGET_USER} to the docker group. Sign out and sign back in once before running docker without sudo."
  else
    mark_fail "Docker user access" "User ${TARGET_USER} is not in the docker group. Docker commands may require sudo."
  fi
}

check_simple_command() {
  local key="$1"
  local binary="$2"
  local success_detail="$3"
  local critical="${4:-yes}"

  if command -v "${binary}" >/dev/null 2>&1; then
    mark_pass "${key}" "${success_detail}"
  else
    if [[ "${critical}" == "yes" ]]; then
      mark_fail "${key}" "${binary} is missing."
    else
      mark_warn "${key}" "${binary} is missing."
    fi
  fi
}

check_versioned_command() {
  local key="$1"
  local binary="$2"
  local critical="${3:-yes}"
  shift 3

  if command -v "${binary}" >/dev/null 2>&1; then
    local output
    output="$("${binary}" "$@" 2>&1 | head -n 1 || true)"
    mark_pass "${key}" "${output:-${binary} is available.}"
  else
    if [[ "${critical}" == "yes" ]]; then
      mark_fail "${key}" "${binary} is missing."
    else
      mark_warn "${key}" "${binary} is missing."
    fi
  fi
}

check_tools() {
  print_header "Checking installed tools"

  check_versioned_command "Git" "git" yes --version
  check_versioned_command "SSH client" "ssh" yes -V
  check_simple_command "SSH keygen" "ssh-keygen" "ssh-keygen is available."
  check_versioned_command "curl" "curl" yes --version
  check_versioned_command "wget" "wget" yes --version
  check_versioned_command "unzip" "unzip" yes -v
  check_versioned_command "gpg" "gpg" yes --version
  check_versioned_command "lsb_release" "lsb_release" yes -ds
  check_versioned_command "jq" "jq" yes --version
  check_versioned_command "Python 3" "python3" yes --version

  if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
    mark_pass "docker compose" "$(docker compose version 2>&1 | head -n 1)"
  else
    mark_warn "docker compose" "docker compose plugin is not available. The current assessment does not require it."
  fi

  local networking_ok=1
  local networking_details=()

  if command -v ss >/dev/null 2>&1; then
    networking_details+=("ss")
  else
    networking_ok=0
  fi

  if command -v ping >/dev/null 2>&1; then
    networking_details+=("ping")
  else
    networking_ok=0
  fi

  if command -v nc >/dev/null 2>&1; then
    networking_details+=("nc")
  else
    networking_ok=0
  fi

  if [[ "${networking_ok}" -eq 1 ]]; then
    mark_pass "Network tools" "Found ${networking_details[*]} for quick connectivity and port checks."
  else
    mark_fail "Network tools" "One or more networking tools are missing. Expected: ss, ping, and nc."
  fi
}

maybe_configure_firewall() {
  if [[ "${CONFIGURE_FIREWALL}" -eq 0 ]]; then
    return
  fi

  print_header "Configuring firewall rules"

  if ! command -v ufw >/dev/null 2>&1; then
    mark_warn "Firewall changes" "ufw is not installed, so no firewall rules were changed. Check your VM or cloud rules manually."
    return
  fi

  local rule_failed=0

  if ! ufw allow 22/tcp >/dev/null 2>&1; then
    rule_failed=1
  fi

  if ! ufw allow 8000/tcp >/dev/null 2>&1; then
    rule_failed=1
  fi

  if [[ "${rule_failed}" -eq 1 ]]; then
    mark_warn "Firewall changes" "One or more ufw rules could not be added. Check 'sudo ufw status' manually."
    return
  fi

  if ufw status 2>/dev/null | grep -q '^Status: active'; then
    mark_pass "Firewall changes" "Added ufw rules for ports 22 and 8000."
  else
    mark_warn "Firewall changes" "Added ufw rules for ports 22 and 8000, but ufw is still inactive. Enable it yourself only if that matches your VM setup."
  fi
}

check_firewall_and_ports() {
  print_header "Checking firewall and port state"

  if command -v ufw >/dev/null 2>&1; then
    local ufw_status
    ufw_status="$(ufw status 2>/dev/null || true)"

    if grep -q '^Status: active' <<<"${ufw_status}"; then
      if grep -Eq '^22/tcp[[:space:]]+ALLOW' <<<"${ufw_status}" && grep -Eq '^8000/tcp[[:space:]]+ALLOW' <<<"${ufw_status}"; then
        mark_pass "Firewall rules" "ufw is active and allows ports 22 and 8000."
      else
        mark_warn "Firewall rules" "ufw is active, but ports 22 and 8000 are not both clearly allowed. Check 'sudo ufw status'."
      fi
    else
      mark_warn "Firewall rules" "ufw is installed but inactive. Make sure your VM or cloud firewall allows ports 22 and 8000."
    fi
  else
    mark_warn "Firewall rules" "ufw is not available. Make sure your VM or cloud firewall allows ports 22 and 8000."
  fi

  if command -v ss >/dev/null 2>&1; then
    if ss -ltn | awk 'NR>1 {print $4}' | grep -Eq '(^|:)8000$'; then
      mark_warn "Port 8000" "Port 8000 is already in use on this machine. The assessment app may need that port."
    else
      mark_pass "Port 8000" "Port 8000 appears free on this machine."
    fi
  else
    mark_warn "Port 8000" "Could not verify port 8000 because 'ss' is not available."
  fi
}

main() {
  detect_ubuntu
  require_root_for_install
  print_plan
  install_packages
  ensure_docker_service
  ensure_docker_group_access
  check_tools
  maybe_configure_firewall
  check_firewall_and_ports
  print_summary
  exit "${EXIT_CODE}"
}

main
