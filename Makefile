FILTER=include-code-files.lua

source.pdf: Collections.java source.md
	pandoc \
		--lua-filter=${FILTER} \
		--output source.pdf \
		source.md
	cp source.pdf /var/www/html/

clean:
	rm -f source.pdf
