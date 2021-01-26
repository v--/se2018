TOPICS := $(patsubst topics/%,topics/%/index.pdf,$(wildcard topics/*))
COMPILER := latexmk -cd -interaction=batchmode -time -bibtex

.PHONY: all clean install-hook

all: $(TOPICS)

topics/%/index.pdf: topics/%/index.tex topics/%/references.bib common/*.sty .git/gitHeadInfo.gin
	$(COMPILER) $(<D)/index.tex -pdflua

clean:
	rm -fv topics/*/index.pdf
	rm -fv topics/*.log # luatex
	rm -fv topics/*.{aux,out,fls} # latex
	rm -fv topics/*.fdb_latexmk # latexmk
	rm -fv topics/*.{bbl,bcf,blg,run.xml} # biber

install-hook:
	cp gitinfo2_hook.sh .git/hooks/post-checkout
	cp gitinfo2_hook.sh .git/hooks/post-commit
	cp gitinfo2_hook.sh .git/hooks/post-merge
	chmod +x .git/hooks/post-{checkout,commit,merge}
