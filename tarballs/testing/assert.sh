# A function for doing assertions in tests

# If given 2 or more arguments, the first argument is the message to print in
# case of failure. Otherwise the message is the command that's run.
assert () {
    local __msg
    if [[ $# -ge 2 ]]; then
        __msg=$1
        shift
    else
        __msg="$@"
    fi
    eval "$@" || echo "Assert fail: $__msg"
}

