TOPICS := $(patsubst topics/%,topics/%/index.pdf,$(wildcard topics/*))
COMPILER := latexmk -cd -interaction=batchmode -time -bibtex

.PHONY: all clean

all: $(TOPICS)

topics/%/index.pdf: topics/%/index.tex topics/%/references.bib common/*.sty
	$(COMPILER) $(<D)/index.tex -pdflua

clean:
	rm -fv topics/*/index.pdf
	rm -fv topics/*/*.{aux,log,out,fls}
	rm -fv topics/*/*.fdb_latexmk
	rm -fv topics/*/*.{run.xml,bbl,bcf,blg}
