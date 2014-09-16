#!/bin/bash

# very crude script to generate makefile.pkgs and makefile.deps

# osg-koji regen-repo osg-el6-internal      

if [[ $UID = 0 && ! -e /etc/yum.repos.d/osg-el6-internal.repo ]]; then
  cd /etc/yum.repos.d
  perl -pe 's/3.2-//g; s/(minefield|development)/internal/g' osg-el6-minefield.repo > osg-el6-internal.repo
  cd - >/dev/null
fi

repoquery --disablerepo=\* --enablerepo=osg-{development,internal} -qa --source  | sort -u | perl -lpe 's/\.src\.rpm$//' > src.rpm.list
perl -lpe 's/(-[^-]+){2}$//' src.rpm.list | sort -u > src.pkg.list

# yumdownload all src rpms
for x in $(<src.rpm.list ); do
  yumdownloader -q --disablerepo=\* --enablerepo=osg-{development,internal} --source $x
done

baseurl=http://koji-hub.batlab.org/mnt/koji/repos
primary=latest/x86_64/repodata/primary.sqlite.bz2
wget -Oprimary.internal.sqlite.bz2    $baseurl/osg-el6-internal/$primary
wget -Oprimary.development.sqlite.bz2 $baseurl/osg-3.2-el6-development/$primary
bunzip2 primary.*.sqlite.bz2

mkdir breqs

# extract bld reqs
for x in *.src.rpm; do
  rpm -qp --requires "$x" > breqs/${x%-*-*.src.rpm}
done

# limit to build reqs that are package names
cd breqs
perl -pi -e 's/ .*//' *
for x in *; do sort -uo $x $x; done
sed -i /:/d *
grep . * | tr : ' ' > ../src-bld-reqs
cd ..

{ sqlite3 primary.internal.sqlite    "select a.name, b.name from packages a join provides b on a.pkgkey = b.pkgkey"
  sqlite3 primary.development.sqlite "select a.name, b.name from packages a join provides b on a.pkgkey = b.pkgkey"
} | tr '|' ' ' | sort -u > bin.pkg.provides

{ sqlite3 primary.internal.sqlite    "select name, rpm_sourcerpm from packages"
  sqlite3 primary.development.sqlite "select name, rpm_sourcerpm from packages"
} | tr '|' ' ' | perl -lpe 's/(-[^-]+){2}$//' | awk '{print $2,$1}' | sort -u > src.pkg.provides

sqlite3 reqs.db '
create table breq (srcpkg,req);
create table sprov (srcpkg,binpkg);
create table bprov (binpkg,prov);
create table srcpkgs (srcpkg);
create table binpkgs (binpkg);
'

{ tab2sqlite breq  src-bld-reqs
  tab2sqlite sprov src.pkg.provides
  tab2sqlite bprov bin.pkg.provides
  tab2sqlite srcpkgs src.pkg.list
  awk '{print $2}' src.pkg.provides | tab2sqlite binpkgs
} | sqlite3 reqs.db

sqlite3 reqs.db '
create table sdeps as
select distinct a.srcpkg name, c.srcpkg req
  from breq a
  join bprov b
    on a.req = b.prov
  join sprov c
    on b.binpkg = c.binpkg;
'

# gen makefile pkgs/deps

sqlite3 reqs.db "
  select 'PKGS = ' || group_concat(srcpkg, ' ') from srcpkgs;
" > makefile.pkgs

sqlite3 reqs.db "
select name || ': ' ||
       group_concat(req, ' ')
  from sdeps
 group by name;
" > makefile.deps

