#!/opt/homebrew/bin/bash
set -euo pipefail

for file in *.sh; do
    # echo in front with -v shows us what will be executed
    echo mv -v "$file" "${file/sh/SH}"
done