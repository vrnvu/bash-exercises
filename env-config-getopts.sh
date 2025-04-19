#!/opt/homebrew/bin/bash
set -euo pipefail

curr_env=""

function usage() {
    echo "usage: $0 -e (DEV, PRE, PRO)"
    exit 1
}

# getopts its designed for short opts, its not recommended to try to hack long here
# https://stackoverflow.com/questions/12022592/how-can-i-use-long-options-with-the-bash-getopts-builtin
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

if [[ -z "$curr_env" ]]; then
    echo "environment not set"
    usage
fi

echo "$curr_env"