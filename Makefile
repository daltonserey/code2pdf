FILTER=include-code-files.lua

source.pdf: java_source/*.java
	pandoc \
		--lua-filter=${FILTER} \
		--output source.pdf \
		source.md

clean:
	rm -f source.pdf
