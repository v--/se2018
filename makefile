TOPICS := $(patsubst topics/%,topics/%/index.pdf,$(wildcard topics/*))
COMPILER := pdflatex -interaction=batchmode

.PHONY: all clean

all: $(TOPICS)

topics/%/index.pdf: topics/%/index.tex topics/%/references.bib common/topic.cls common/*.sty
	cd $(<D) && \
	$(COMPILER) -draftmode index.tex && \
	biber index.bcf && \
	$(COMPILER) -draftmode index.tex && \
	$(COMPILER) index.tex

clean:
	rm -fv topics/*/index.pdf
	rm -fv topics/*/*.log # tex
	rm -fv topics/*/*.{aux,out,fls} # latex
	rm -fv topics/*/*.{bbl,bcf,blg,run.xml} # biber
	rm -fv revision

revision:
	LC_ALL=bg_BG.UTF-8 git log --max-count 1 --format=format:"%h от %cd" --date='format:%d %B %Y' HEAD > revision
