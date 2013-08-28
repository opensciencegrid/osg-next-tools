#!/bin/bash
cd /usr/local/repo/tarball-install

SORT_BY_VERSION="/root/sort_by_version.pl"
for dver in "el5" "el6"; do
    for arch in "i386" "x86_64"; do
        for metapkg in "osg-wn-client" "osg-client"; do
            latest=`ls 3*/${metapkg}-*.${dver}.${arch}.tar.gz | $SORT_BY_VERSION | tail -n 1`
            if [ X$latest = X ] || [ ! -e $latest ]; then
                echo WARNING: Tarball not found for $metapkg $dver $arch
            else
               symlink=${metapkg}-latest.${dver}.${arch}.tar.gz
               ln -s $latest $symlink
            fi
        done
    done
done
