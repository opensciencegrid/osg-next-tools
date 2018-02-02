# OSG Next Tools

This repository contains miscellaneous scripts used for transitioning
to a new OSG release series.  Some are mainly historical reference
material at this point.


This README is a place for documenting some of these miscellaneous tasks.

---

### Creating custom koji tags for a project


Occasionally we want to make a set of koji builds that are not ready to go
into the development repos.  For this, we can create new koji tags and set
up the appropriate tag inheritance and build targets.  When koji builds
are done specifying the new build targets, they will end up in the repos
for the new koji tags, rather than the default osg development repos.

We have the following script for this task:

[`new-koji-area`](koji/new-koji-area)

In its current form, the variables `NAME`, `EL`, and `SERIES` must be set
in the script before use.  The script will create a new koji build target
named `$NAME-$EL`, and a new koji tag (repo) with the same name.

To install packages out of the new koji tag repo, you can make a copy of
the osg-minefield.repo file under /etc/yum.config.d/, and edit the baseurl
to change `osg-3.X-elY-development` to the `${NAME}-${EL}Y` for your new
tag.

