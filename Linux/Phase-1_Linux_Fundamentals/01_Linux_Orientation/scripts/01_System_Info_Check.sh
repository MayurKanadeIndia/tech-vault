#!/usr/bin/env bash
#
# ==============================================================================
# System Information Report Script
# Report would be generated within the same folder.------------------------------------------------------------------------------
# Description:
#   Collects and displays key system information in a clean, structured format.
#
# Author: MAYUR KANADE
# Version: 1.0.0
# ==============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="${SCRIPT_DIR}/system_report_$(date +%F_%H-%M-%S).log"

exec > "$LOG_FILE" 2>&1


set -o errexit
set -o pipefail
set -o nounset

# ----------------------------- Constants --------------------------------------

readonly SCRIPT_NAME="$(basename "$0")"

# ----------------------------- Functions --------------------------------------

log_section() {
    local title="$1"
    printf "\n==== %s ====\n" "$title"
}

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

get_kernel_info() {
    log_section "Kernel Information"

    printf "Kernel Version : %s\n" "$(uname -r)"
    printf "\n"

    printf "%-15s : %s\n" "Kernel Name"   "$(uname -s)"
    printf "%-15s : %s\n" "Hostname"      "$(uname -n)"
    printf "%-15s : %s\n" "Release"       "$(uname -r)"
    printf "%-15s : %s\n" "Version"       "$(uname -v)"
    printf "%-15s : %s\n" "Architecture"  "$(uname -m)"
}

get_os_info() {
    log_section "Operating System"

    if [[ -f /etc/os-release ]]; then
        # shellcheck disable=SC1091
        source /etc/os-release
        printf "%-15s : %s\n" "Name"        "${NAME:-N/A}"
        printf "%-15s : %s\n" "Version"     "${VERSION:-N/A}"
        printf "%-15s : %s\n" "ID"          "${ID:-N/A}"
        printf "%-15s : %s\n" "Pretty Name" "${PRETTY_NAME:-N/A}"
    else
        printf "OS information not available (/etc/os-release missing)\n"
    fi
}

get_uptime_info() {
    log_section "Uptime & Time Information"

    local uptime_pretty="N/A"
    local boot_time="N/A"

    if command_exists uptime; then
        uptime_pretty="$(uptime -p | sed 's/^up //')"
        boot_time="$(uptime -s)"
    fi

    printf "%-20s : %s\n" "Local Time"       "$(date +'%r (%Z)')"
    printf "%-20s : %s\n" "Date"             "$(date +'%A, %d %B %Y')"
    printf "%-20s : %s\n" "Uptime"           "$uptime_pretty"
    printf "%-20s : %s\n" "Boot Time"        "$boot_time"
}

get_user_info() {
    log_section "User Information"

    printf "%-15s : %s\n" "Current User" "$(whoami)"

    if command_exists id; then
        printf "%-15s : %s\n" "User ID (UID)" "$(id -u)"
        printf "%-15s : %s\n" "Group ID (GID)" "$(id -g)"
    fi
}

# ----------------------------- Main -------------------------------------------

main() {
    log_section "System Information Report"

    get_kernel_info
    get_os_info
    get_uptime_info
    get_user_info

    printf "\nReport generated successfully by %s\n" "$SCRIPT_NAME"
}

main "$@"
