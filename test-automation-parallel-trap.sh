#!/opt/homebrew/bin/bash
set -euo pipefail

# Handle interrupt from failed test
cleanup() {
    echo "[!] Cleaning up. A test failed."
    # Notice this also kills the shell that launch the script
    jobs -p | xargs kill 2>/dev/null || true
    exit 1
}
# good practice using trap to handle interrupts
# we are using SIGUSR1
trap cleanup SIGUSR1

success() {
    echo "test passes"
    sleep 2 # simulate work
    return 0
}

success_with_args() {
    sleep 2
    [[ $1 == "expected" ]] || return 1
    return 0
}

fail() {
    echo "test fail"
    sleep 1 # simulate work
    return 1
}

run_test() {
    local name=$1
    shift
    echo "[RUNNING] $name"
    if "$@"; then
        echo "[OK] $name passed"
        return 0
    else
        echo "[ERROR] $name failed"
        # we sing a kill SIGUSR1 to singal a test failed and short-circuit
        kill -SIGUSR1 $PPID
        return 1
    fi
}

main() {
    run_test success success &
    pid1=$!
    
    run_test fail fail &
    pid2=$!

    run_test success_with_args success_with_args "expected" &
    pid3=$!
 
    run_test success_with_args success_with_args "this is not expected" &
    pid4=$!   

    wait $pid1 || echo "[!] success test failed"
    wait $pid2 || echo "[!] fail test failed"
    wait $pid3 || echo "[!] success_with_args test failed"
    wait $pid4 || echo "[!] success_with_args test failed"
    
    echo "All tests finished"
}

main