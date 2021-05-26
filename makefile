TOPICS := $(patsubst topics/%,topics/%/index.pdf,$(wildcard topics/*))
COMPILER := pdflatex -interaction=batchmode

.PHONY: all clean output-revision

all: $(TOPICS)

topics/%/index.pdf: topics/%/index.tex topics/%/references.bib common/topic.cls common/*.sty revision
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

output-revision:
	LC_ALL=bg_BG.UTF-8 git --no-pager log -1 --date='format:%d %B %Y' --decorate=short --pretty=format:"%h от %cd" HEAD > revision
