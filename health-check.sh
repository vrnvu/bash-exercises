#!/opt/homebrew/bin/bash
set -euo pipefail

host=localhost:3141
count=1
seconds=1
max_retry=5
retry_delay_seconds=1

retry=1
while (( retry <= max_retry )); do
    echo "Retry $retry: pinging $host..."
    if ping -c $count -i $seconds $host ; then
        exit 0
    else
        sleep "$retry_delay_seconds"
        ((retry++))
    fi
done

exit 1