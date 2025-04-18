#!/opt/homebrew/bin/bash
set -euo pipefail

file_backup=README.md
dir_backup=backup
ts=$(date '+%Y-%m-%d')

create_dir() {
    if [[ ! -d "$1" ]]; then
        mkdir -p "$1"
    fi
}

assert_file_exists() {
    if [[ ! -f "$1" ]]; then
        echo "'$1' does not exit"
        exit 1
    fi
}

assert_file_exists "$file_backup"
create_dir "$dir_backup"
cp "$file_backup" "$dir_backup"/"$ts"-"$file_backup"