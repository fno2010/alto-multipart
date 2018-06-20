TARGETS_DRAFTS := draft-tbd-alto-multipart
TARGETS_TAGS := 
draft-tbd-alto-multipart-00.md: draft-tbd-alto-multipart.md
	sed -e 's/draft-tbd-alto-multipart-latest/draft-tbd-alto-multipart-00/g' $< >$@
