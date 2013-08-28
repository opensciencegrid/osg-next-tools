#!/bin/bash

tarballs_dir=${1-%/}
tarballs_dir_bak=${tarballs_dir}.bak

die () {
    echo "$@" 1>&2
    exit 1
}

if [[ -z $tarballs_dir ]]; then
    die "Tarballs directory not specified or null. This is /usr/local/repo/tarball-install on repo.grid.iu.edu"
fi

if [[ ! -d $tarballs_dir ]]; then
    die "$tarballs_dir is not a directory"
fi

# Note: rsync is very particular about trailing slashes.
rsync -av $tarballs_dir/ $tarballs_dir_bak

