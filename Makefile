DOC  := tsm-net.tex
BUILD := build

RERUN := "(undefined references|Rerun to get (cross-references|the bars|point totals) right|Table widths have changed. Rerun LaTeX.|Linenumber reference failed)"
RERUNBIB := "No file.*\.bbl|Citation.*undefined"

all: doc

$(BUILD):
	mkdir $(BUILD)

doc: $(DOC:.tex=.pdf)

%.pdf: %.tex $(BUILD)
	xelatex -output-directory=$(BUILD) $<
	@egrep -q $(RERUNBIB) $(BUILD)/$*.log && (cp $(DOC:.tex=.bib) $(BUILD); cd $(BUILD); bibtex $*) && xelatex -output-directory=$(BUILD) $<; true
	@egrep -q $(RERUN) $(BUILD)/$*.log && xelatex -output-directory=$(BUILD) $<; true
	@egrep -q $(RERUN) $(BUILD)/$*.log && xelatex -output-directory=$(BUILD) $<; true
	cp $(BUILD)/$@ .

latexmk: $(BUILD)
	-latexmk -pvc -xelatex -output-directory=$(BUILD) $(DOC)

purge:
	-rm -rf $(BUILD)

clean: purge
	-rm -f $(DOC:.tex=.pdf)

.PHONY: all doc latexmk purge clean
