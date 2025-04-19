#!/opt/homebrew/bin/bash
set -euo pipefail

# super useful and short way to do simple actions
# until is a ! while
until ssh user@10.10.10.10; do sleep 3; done