TARGETS_DRAFTS := draft-zhang-alto-multipart
TARGETS_TAGS := draft-zhang-alto-multipart-00 draft-zhang-alto-multipart-01
.INTERMEDIATE: draft-zhang-alto-multipart-00.md
draft-zhang-alto-multipart-00.md:
	git show "draft-zhang-alto-multipart-00:draft-zhang-alto-multipart.md" | sed -e 's/draft-zhang-alto-multipart-latest/draft-zhang-alto-multipart-00/g' >$@
.INTERMEDIATE: draft-zhang-alto-multipart-01.md
draft-zhang-alto-multipart-01.md:
	git show "draft-zhang-alto-multipart-01:draft-zhang-alto-multipart.md" | sed -e 's/draft-zhang-alto-multipart-latest/draft-zhang-alto-multipart-01/g' >$@
draft-zhang-alto-multipart-02.md: draft-zhang-alto-multipart.md
	sed -e 's/draft-zhang-alto-multipart-latest/draft-zhang-alto-multipart-02/g' $< >$@
diff-draft-zhang-alto-multipart.html: draft-zhang-alto-multipart-01.txt draft-zhang-alto-multipart-02.txt
	-$(rfcdiff) --html --stdout $^ > $@
