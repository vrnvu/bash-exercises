#!/opt/homebrew/bin/bash
set -euo pipefail

files=$(fd --extension md)
for file in $files; do
    echo "$file"
done