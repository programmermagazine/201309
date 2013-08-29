RMD  = $(wildcard *.Rmd)
MD   = $(RMD:.Rmd=.md)
HTML = $(RMD:.Rmd=.html)
XCF = $(wildcard *.xcf)
PNG = $(XCF:.xcf=.png)

all: $(MD) $(HTML)

%.md: %.Rmd
	Rscript -e "require(knitr);knit('$<','$@')"

%.html: %.md
	~/.cabal/bin/pandoc -s --self-contained $< -o $@

%.png: %.xcf
	mogrify -format png $<

clean:
	-rm *.md *.html
