#!/opt/homebrew/bin/bash
set -euo pipefail

curr_env="UNSET"

usage() {
    echo "usage: $0 -e (DEV, PRE, PRO)"
    exit 1
}

# getopts its designed for short opts, its not recommended to try to hack long here
while getopts ":e:" option; do
    case $option in
        e)
            if [[ -z "${OPTARG:-}" ]]; then
                echo "missing argument for -e"
                usage
            fi
            case ${OPTARG} in
                DEV) curr_env=$OPTARG;;
                PRE) curr_env=$OPTARG;;
                PRO) curr_env=$OPTARG;;
                *) 
                    echo "invalid env: ${OPTARG}"
                    usage
            esac
            ;;
        \?)
            echo "unknown option: -$OPTARG"
            usage
            ;;
        :)
            echo "missing argument for -$OPTARG"
            usage
            ;;
    esac
done

if [[ "$curr_env" = "UNSET" ]]; then
    echo "environment not set"
    usage
fi

echo "$curr_env"