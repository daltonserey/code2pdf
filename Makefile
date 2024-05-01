FILTER=include-code-files.lua

build: source.pdf source2.pdf

source.pdf: java_source/*.java
	pandoc \
        --to html \
		--lua-filter=${FILTER} \
		--output source.pdf \
		source.md

source.html: java_source/*.java
	pandoc \
        --standalone \
		--lua-filter=${FILTER} \
		--output source.html \
		source.md

source2.pdf: source.html
	cat source.html \
	| wkhtmltopdf -T 20 -B 20 \
	              -L 20 -R 20 \
                  - source2.pdf

clean:
	rm -f source.pdf
	rm -f source2.pdf
	rm -f source.html
