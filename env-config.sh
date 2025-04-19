#!/opt/homebrew/bin/bash
set -euo pipefail

if [[ $# != 1 ]]; then
    echo "usage: env-config.sh (DEV, PRE, PRO)"
    exit 1
fi

curr_env=""
# this is equivalent to
# for arg in "$@"; do
for arg; do
    case $arg in
        DEV) curr_env="DEV";;
        PRE) curr_env="PRE";;
        PRO) curr_env="PRO";;
        *) echo "unknown env: $arg"; exit 1;;
    esac
done

if [[ -z "$curr_env" ]]; then
    echo "unreachable curr_env: unset"
    exit 1
fi

echo "$curr_env"