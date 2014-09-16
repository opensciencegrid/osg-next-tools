#!/bin/bash

# prints groups of remaining targets in dependency order
# run with any extra make options, eg: ./groups.sh skips

SLEEP=0.5

make -j SLEEP=$SLEEP "$@" 2>/dev/null &

trap 'if test -e /proc/${!}; then kill %1; fi' EXIT

sleep $(perl -e "print $SLEEP/2")
echo
while test -e /proc/${!} && sleep $SLEEP; do
  echo
done

