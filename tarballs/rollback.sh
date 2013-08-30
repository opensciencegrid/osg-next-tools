#!/bin/bash

tarballs_dir=${1:-/usr/local/repo/tarball-install}
tarballs_dir=$(dirname "$tarballs_dir")/$(basename "$tarballs_dir")
tarballs_dir_bak=$(dirname "$tarballs_dir")/.$(basename "$tarballs_dir").bak

die () {
    echo "$@" 1>&2
    exit 1
}

if [[ ! -d $tarballs_dir ]]; then
    die "$tarballs_dir is not a directory"
fi

if [[ ! -d $tarballs_dir_bak ]]; then
    die "Backup directory $tarballs_dir_bak doesn't exist"
fi

# Note: rsync is very particular about trailing slashes.
rsync -aH --delete-after $tarballs_dir_bak/ $tarballs_dir
if [[ $? -eq 0 ]]; then
    echo "Rollback from $tarballs_dir_bak OK"
else
    echo "Rollback from $tarballs_dir_bak failed somewhere"
fi

