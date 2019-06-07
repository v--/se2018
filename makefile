TOPICS := $(patsubst topics/%,topics/%/index.pdf,$(wildcard topics/*))

.PHONY: all

all: $(TOPICS)

topics/%/index.pdf: topics/%/index.tex topics/%/references.bib common/*.sty
	cd $(<D) && arara --verbose index.tex || rm --force $(<D)/*.aux
