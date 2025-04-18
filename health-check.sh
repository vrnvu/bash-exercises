#!/opt/homebrew/bin/bash
set -euo pipefail

host=google.com
count=1
seconds=1

if ping -c $count -i $seconds $host &> /dev/null; then
    exit 0
else
    exit 1
fi