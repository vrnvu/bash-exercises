#!/opt/homebrew/bin/bash
# This is the good practice
# -e Exit on error Avoids continuing after a failed command (common source of bugs)
# -u Treat unset variables as errors Catches typos or forgotten vars early
# -o pipefail If any part of a pipe fails, the whole pipeline fails Ensures you catch failures like: `grep something file

set -euo pipefail

function sucess() {
    echo "test passes"
    return 0
}

function fail() {
    echo "test fail"
    return 1
}

function main() {
    sucess
    sucess
    fail
    sucess # unracheable, fail returns 1, the `set -euo pipefail` will exit
    # set -e ensures any non-zero return kills the script, no need for exit in helpers
}

main