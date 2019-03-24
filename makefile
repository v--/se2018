TOPICS_SRC := $(wildcard topics/*)
TOPICS_DEST := $(patsubst topics/%,build/%.pdf,${TOPICS_SRC})

.PHONY: all

all: build/ ${TOPICS_DEST}

build/:
	mkdir build

build/%.pdf: topics/%/index.tex topics/%/references.bib common/*.sty
	cd $(<D) && arara --verbose index.tex
	mv $(<D)/index.pdf $@
