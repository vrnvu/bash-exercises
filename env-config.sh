#!/opt/homebrew/bin/bash
set -euo pipefail

if [[ $# != 1 ]]; then
    echo "usage: env-config.sh (DEV, PRE, PRO)"
    exit 1
fi

curr_env="UNSET"
for arg in "$@"; do
    case $arg in
        dev) curr_env="DEV";;
        pre) curr_env="PRE";;
        pro) curr_env="PRO";;
        *) echo "unknown env: $arg"; exit 1;;
    esac
done

if [[ "$curr_env" = "UNSET" ]]; then
    echo "unreachable curr_env: unset"
    exit 1
fi

ehco "$curr_env"