#!/opt/homebrew/bin/bash
set -euo pipefail

count=1
seconds=1

if ping -c $count -i $seconds google.com &> /dev/null; then
    exit 0
else
    exit 1
fi