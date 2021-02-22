TOPICS := $(patsubst topics/%,topics/%/index.pdf,$(wildcard topics/*))
COMPILER := latexmk -cd -interaction=batchmode -time -bibtex

.PHONY: all clean output-revision

all: $(TOPICS)

topics/%/index.pdf: topics/%/index.tex topics/%/references.bib common/*.sty revision
	$(COMPILER) $(<D)/index.tex -pdflua

clean:
	rm -fv topics/*/index.pdf
	rm -fv topics/*/*.log # luatex
	rm -fv topics/*/*.{aux,out,fls} # latex
	rm -fv topics/*/*.fdb_latexmk # latexmk
	rm -fv topics/*/*.{bbl,bcf,blg,run.xml} # biber

output-revision:
	git --no-pager log -1 --date=short --decorate=short --pretty=format:"%h (%cd)" HEAD > revision
