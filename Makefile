DOCS = main.pdf

BIBLIO = ./references.bib
ABSTRACT = abstract.tex
ACKN = acknowledgements.tex
DECL = declaration.tex
C1 = C1_intro/introduction.tex
C2 = C2_cw/cw_intro.tex
C3 = C3_soap/viterbi.tex
C4 = C4_cnn/cnn.tex
C5 = C5_detchar/det_char.tex
C6 = C6_summary/summary.tex

BYPROD = *.aux *.log *.out *.dvi *.bbl *.blg

default: git-tag $(DOCS) $(FIGS)

.PHONY : git-tag

git-tag:
	./git-tag.sh

main.pdf: main.tex $(BIBLIO)
	pdflatex $(@:.pdf=) && biber $(@:.pdf=) && pdflatex $(@:.pdf=) && makeglossaries $(@:.pdf=) &&pdflatex $(@:.pdf=) && pdflatex $(@:.pdf=)

%.pdf: %.eps
	epstopdf --outfile=$@ $(@:.pdf=.eps)

clean:
	rm -f $(DOCS) $(BYPROD)
