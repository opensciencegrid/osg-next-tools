# A function for doing assertions in tests

# If given 2 or more arguments, the first argument is the message to print in
# case of failure. Otherwise the message is the command that's run.
# ASSERT_FAIL (not local!) is set to 1 on failure so the script can print an
# Ok if no failures happened.
assert () {
    local __msg
    if [[ $# -ge 2 ]]; then
        __msg=$1
        shift
    else
        __msg="$@"
    fi
    eval "$@"
    if [[ $? -ne 0 ]]; then
        ASSERT_FAIL=1
        echo "Assert fail: $__msg"
        return $?
    fi
}

