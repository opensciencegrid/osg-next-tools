#!/bin/bash

tarballs_dir=${1:-/usr/local/repo/tarball-install}
SORT_BY_VERSION=$(readlink -f $(dirname $0)/sort_by_version.pl)

die () {
    echo "$@" 1>&2
    exit 1
}

if [[ ! -x $SORT_BY_VERSION ]]; then
    die "$SORT_BY_VERSION script not found or not executable"
fi

if [[ ! -d $tarballs_dir ]]; then
    die "$tarballs_dir is not a directory"
fi

cd $tarballs_dir


for majorver in 3.*; do
    pushd $majorver > /dev/null
    for dver in "el5" "el6" "el7"; do
        for arch in "i386" "x86_64"; do
            for metapkg in "osg-wn-client" "osg-client"; do
                file=$(find . -name ${metapkg}-*.${dver}.${arch}.tar.gz -print -quit)
                if test -n "$file"; then
                   latest=`ls 3*/${metapkg}-*.${dver}.${arch}.tar.gz | $SORT_BY_VERSION | tail -n 1`
                   symlink=${metapkg}-latest.${dver}.${arch}.tar.gz
                   ln -sf $latest $symlink
                fi
            done
        done
    done
    popd > /dev/null
done

