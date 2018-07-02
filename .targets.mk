TARGETS_DRAFTS := draft-zhang-alto-multipart
TARGETS_TAGS := 
draft-zhang-alto-multipart-00.md: draft-zhang-alto-multipart.md
	sed -e 's/draft-zhang-alto-multipart-latest/draft-zhang-alto-multipart-00/g' $< >$@
