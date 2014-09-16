include makefile.pkgs

SLEEP = 0
SHELL = /bin/bash

all: $(PKGS)

$(PKGS):
	@echo $@
	@sleep $(SLEEP)

# not gonna try these for now...

# these break currently
SKIPS += maven22                        # download errors?
SKIPS += glite-ce-cream-utils           # no sl7 sources in srpm (or upstream)
SKIPS += glite-service-discovery-api-c  # fails after build in rpm checks
SKIPS += emi-trustmanager               # javac compile errors
SKIPS += osg-discovery                  # maven2
SKIPS += osg-webapp-common              # %{webappsdir} not defined
SKIPS += voms-admin-client              # no package for python-ZSI

# leaving out on purpose for some other reason
SKIPS += lcg-utils                      # obsoleted by lcg-util
# SKIPS += osg-java7-compat               # just to avoid building java pkgs...

$(SKIP): forget-it

forget-it:
	@false

skips:
	@$(MAKE) -k --no-print-directory SKIP="$(SKIPS)" 2>/dev/null || :

sentinels:
	@(osg-koji list-tagged --quiet osg-3.2-el7-development; \
	  osg-koji list-tagged --quiet osg-el7-internal \
	 ) | awk '{print $$1}' | perl -lpe 's/(-[^-]+){2}$$//' | xargs touch
	@make -k 2>/dev/null | fgrep -xf <(ls) | xargs touch

list-all:
	@echo $(PKGS) | tr ' ' '\n'
clean:
	@rm -f $(PKGS)

.PHONY: all forget-it skips sentinels list-all clean

include makefile.deps

