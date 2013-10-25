
default: missing.txt

missing.txt: newtags package-list
	./whatsmissing > missing.txt

newtags: package-list builds
	rm -rf newtags dupes
	mkdir newtags dupes
	./mk-newtags

builds:
	mkdir builds
	./pull-from-koji


package-list:
	./get-trunk-dirs > package-list

3.2-tags:
	./create-tags

apply-tags: newtags 3.2-tags
	./tag-builds

clean:
	rm -rf newtags dupes package-list missing.txt

clean-all: clean
	rm -rf builds

.PHONY: all clean clean-all apply-tags 3.2-tags

