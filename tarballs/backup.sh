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

# Note: rsync is very particular about trailing slashes.
rsync -aH $tarballs_dir/ $tarballs_dir_bak
if [[ $? -eq 0 ]]; then
    echo "Backups into $tarballs_dir_bak OK"
else
    echo "Backups into $tarballs_dir_bak failed somewhere"
fi

