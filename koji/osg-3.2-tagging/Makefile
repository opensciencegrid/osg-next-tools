
default: missing.list

missing.list: newtags trunk-dirs
	./whatsmissing > missing.list

newtags: trunk-dirs builds
	mkdir newtags dupes
	./mk-newtags

builds:
	mkdir builds
	./pull-from-koji


trunk-dirs:
	./get-trunk-dirs > trunk-dirs

apply-tags:
	./tag-builds

clean:
	rm -rf newtags dupes trunk-dirs missing.list

clean-all: clean
	rm -rf builds

.PHONY: all clean clean-all apply-tags

