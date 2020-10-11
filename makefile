TOPICS := $(patsubst topics/%,topics/%/index.pdf,$(wildcard topics/*))
COMPILER := latexmk -cd -interaction=batchmode -time -bibtex

.PHONY: all clean

all: $(TOPICS)

topics/%/index.pdf: topics/%/index.tex topics/%/references.bib common/*.sty
	$(COMPILER) $(<D)/index.tex -pdflua

clean:
	@:$(foreach topic, $(wildcard topics/*), \
		rm -fv $(topic)/index.pdf; \
		rm -fv $(topic)/*.{aux,log,out,fls,toc}; \
		rm -fv $(topic)/*.fdb_latexmk; \
		rm -fv $(topic)/*.{run.xml,bbl,bcf,blg}; \
		rm -fv $(topic)/*.{aoc,lem,usc}; \
	)
