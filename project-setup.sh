#!/opt/homebrew/bin/bash
set -euo pipefail

directory=my_app
curr_folder=$(basename "${PWD}")
force=false

function log()    { echo "[INFO] $*"; }
function error()  { echo "[ERROR] $*" >&2; }

function usage() {
	# <<< is the recommended practice for strings
	cat <<< "Usage: $(basename "$0") [OPTIONS]
	Options:
  --force       Delete existing '$directory' before creating it again
  --help        Show this help message"
}

function create_dir() {
	mkdir -p "$1" || {
		error "failed to create dir: $1"
		exit 1
	}
}

function create_file() {
	touch "$1" || {
		error "failed to create file: $1"
		exit 1
	}
}

# Idiom for
# for arg in "$@"; do
for arg; do
	case $arg in
		--force) force=true ;;
		--help) usage ;;
		*) error "Unknown option: $arg"; usage ;;
	esac
done

# [[ is the recommended testing command
# "$directory" recommneded instead of $directory
if [[ -d "$directory" ]]; then
	if $force; then
		log "$directory already exists in $curr_folder, will be replaced"
	else
		log "$directory already exists in $curr_folder"
		exit 0
	fi
fi

log "creating $directory in $curr_folder"
create_dir "$directory/src" 
create_dir "$directory/tests" 
create_file "$directory/.env" 
create_file "$directory/README.md"