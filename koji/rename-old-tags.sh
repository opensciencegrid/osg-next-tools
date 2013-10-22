#!/bin/bash

# rename build targets
osg-koji edit-target --rename=osg-el5 el5-osg
osg-koji edit-target --rename=osg-el6 el6-osg
osg-koji edit-target --rename=osg-upcoming-el5 el5-osg-upcoming
osg-koji edit-target --rename=osg-upcoming-el6 el6-osg-upcoming

# add new 3.1 targets -- do these after the renames (below)
osg-koji add-target  osg-3.1-el5  osg-3.1-el5-build  osg-3.1-el5-development
osg-koji add-target  osg-3.1-el6  osg-3.1-el6-build  osg-3.1-el6-development

# generate rename script
osg-koji list-tags 'el[56]-osg*' | perl -ne '
  if (/^(el[56])-osg(-upcoming)?(?:(-[a-z]+)(-(?:[\d.]+|build))?)?$/) {
    print "osg-koji edit-tag --rename=osg".($3&&($2||"-3.1"))."-$1".$3.$4, " $_"
  } else {
    print STDERR "# skipping $_"
  }' | column -t | sed -r 's/ (  *)/\1/g' # | bash

# skipping el5-osg-lcmaps-upgrade
# skipping el5-osg-lcmaps-upgrade-build
osg-koji edit-tag --rename=osg-el5                         el5-osg
osg-koji edit-tag --rename=osg-3.1-el5-build               el5-osg-build
osg-koji edit-tag --rename=osg-3.1-el5-contrib             el5-osg-contrib
osg-koji edit-tag --rename=osg-3.1-el5-development         el5-osg-development
osg-koji edit-tag --rename=osg-3.1-el5-prerelease          el5-osg-prerelease
osg-koji edit-tag --rename=osg-3.1-el5-release             el5-osg-release
osg-koji edit-tag --rename=osg-3.1-el5-release-3.0.10      el5-osg-release-3.0.10
osg-koji edit-tag --rename=osg-3.1-el5-release-3.0.3       el5-osg-release-3.0.3
osg-koji edit-tag --rename=osg-3.1-el5-release-3.0.4       el5-osg-release-3.0.4
osg-koji edit-tag --rename=osg-3.1-el5-release-3.0.5       el5-osg-release-3.0.5
osg-koji edit-tag --rename=osg-3.1-el5-release-3.0.6       el5-osg-release-3.0.6
osg-koji edit-tag --rename=osg-3.1-el5-release-3.0.7       el5-osg-release-3.0.7
osg-koji edit-tag --rename=osg-3.1-el5-release-3.0.8       el5-osg-release-3.0.8
osg-koji edit-tag --rename=osg-3.1-el5-release-3.0.9       el5-osg-release-3.0.9
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.0       el5-osg-release-3.1.0
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.1       el5-osg-release-3.1.1
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.10      el5-osg-release-3.1.10
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.11      el5-osg-release-3.1.11
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.12      el5-osg-release-3.1.12
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.13      el5-osg-release-3.1.13
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.14      el5-osg-release-3.1.14
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.15      el5-osg-release-3.1.15
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.16      el5-osg-release-3.1.16
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.17      el5-osg-release-3.1.17
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.18      el5-osg-release-3.1.18
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.19      el5-osg-release-3.1.19
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.2       el5-osg-release-3.1.2
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.20      el5-osg-release-3.1.20
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.21      el5-osg-release-3.1.21
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.22      el5-osg-release-3.1.22
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.23      el5-osg-release-3.1.23
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.24      el5-osg-release-3.1.24
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.25      el5-osg-release-3.1.25
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.3       el5-osg-release-3.1.3
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.4       el5-osg-release-3.1.4
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.5       el5-osg-release-3.1.5
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.6       el5-osg-release-3.1.6
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.7       el5-osg-release-3.1.7
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.8       el5-osg-release-3.1.8
osg-koji edit-tag --rename=osg-3.1-el5-release-3.1.9       el5-osg-release-3.1.9
osg-koji edit-tag --rename=osg-3.1-el5-release-build       el5-osg-release-build
osg-koji edit-tag --rename=osg-3.1-el5-testing             el5-osg-testing
osg-koji edit-tag --rename=osg-upcoming-el5-build          el5-osg-upcoming-build
osg-koji edit-tag --rename=osg-upcoming-el5-development    el5-osg-upcoming-development
osg-koji edit-tag --rename=osg-upcoming-el5-prerelease     el5-osg-upcoming-prerelease
osg-koji edit-tag --rename=osg-upcoming-el5-release        el5-osg-upcoming-release
osg-koji edit-tag --rename=osg-upcoming-el5-release-3.1.19 el5-osg-upcoming-release-3.1.19
osg-koji edit-tag --rename=osg-upcoming-el5-release-3.1.21 el5-osg-upcoming-release-3.1.21
osg-koji edit-tag --rename=osg-upcoming-el5-release-3.1.22 el5-osg-upcoming-release-3.1.22
osg-koji edit-tag --rename=osg-upcoming-el5-release-3.1.23 el5-osg-upcoming-release-3.1.23
osg-koji edit-tag --rename=osg-upcoming-el5-release-3.1.24 el5-osg-upcoming-release-3.1.24
osg-koji edit-tag --rename=osg-upcoming-el5-testing        el5-osg-upcoming-testing
osg-koji edit-tag --rename=osg-el6                         el6-osg
osg-koji edit-tag --rename=osg-3.1-el6-build               el6-osg-build
osg-koji edit-tag --rename=osg-3.1-el6-contrib             el6-osg-contrib
osg-koji edit-tag --rename=osg-3.1-el6-development         el6-osg-development
osg-koji edit-tag --rename=osg-3.1-el6-prerelease          el6-osg-prerelease
osg-koji edit-tag --rename=osg-3.1-el6-release             el6-osg-release
osg-koji edit-tag --rename=osg-3.1-el6-release-3.0.10      el6-osg-release-3.0.10
osg-koji edit-tag --rename=osg-3.1-el6-release-3.0.8       el6-osg-release-3.0.8
osg-koji edit-tag --rename=osg-3.1-el6-release-3.0.9       el6-osg-release-3.0.9
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.0       el6-osg-release-3.1.0
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.1       el6-osg-release-3.1.1
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.10      el6-osg-release-3.1.10
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.11      el6-osg-release-3.1.11
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.12      el6-osg-release-3.1.12
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.13      el6-osg-release-3.1.13
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.14      el6-osg-release-3.1.14
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.15      el6-osg-release-3.1.15
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.16      el6-osg-release-3.1.16
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.17      el6-osg-release-3.1.17
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.18      el6-osg-release-3.1.18
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.19      el6-osg-release-3.1.19
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.2       el6-osg-release-3.1.2
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.20      el6-osg-release-3.1.20
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.21      el6-osg-release-3.1.21
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.22      el6-osg-release-3.1.22
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.23      el6-osg-release-3.1.23
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.24      el6-osg-release-3.1.24
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.25      el6-osg-release-3.1.25
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.3       el6-osg-release-3.1.3
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.4       el6-osg-release-3.1.4
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.5       el6-osg-release-3.1.5
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.6       el6-osg-release-3.1.6
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.7       el6-osg-release-3.1.7
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.8       el6-osg-release-3.1.8
osg-koji edit-tag --rename=osg-3.1-el6-release-3.1.9       el6-osg-release-3.1.9
osg-koji edit-tag --rename=osg-3.1-el6-release-build       el6-osg-release-build
osg-koji edit-tag --rename=osg-3.1-el6-testing             el6-osg-testing
osg-koji edit-tag --rename=osg-upcoming-el6-build          el6-osg-upcoming-build
osg-koji edit-tag --rename=osg-upcoming-el6-development    el6-osg-upcoming-development
osg-koji edit-tag --rename=osg-upcoming-el6-prerelease     el6-osg-upcoming-prerelease
osg-koji edit-tag --rename=osg-upcoming-el6-release        el6-osg-upcoming-release
osg-koji edit-tag --rename=osg-upcoming-el6-release-3.1.19 el6-osg-upcoming-release-3.1.19
osg-koji edit-tag --rename=osg-upcoming-el6-release-3.1.21 el6-osg-upcoming-release-3.1.21
osg-koji edit-tag --rename=osg-upcoming-el6-release-3.1.22 el6-osg-upcoming-release-3.1.22
osg-koji edit-tag --rename=osg-upcoming-el6-release-3.1.23 el6-osg-upcoming-release-3.1.23
osg-koji edit-tag --rename=osg-upcoming-el6-release-3.1.24 el6-osg-upcoming-release-3.1.24
osg-koji edit-tag --rename=osg-upcoming-el6-testing        el6-osg-upcoming-testing

