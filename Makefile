tex = latex
dvips = dvips
pdftex = pdflatex
pandoc = pandoc

.SUFFIXES: .tex .ps .pdf
.tex.dvi:
	$(tex) $*
	$(tex) $*

.tex.pdf:
	$(pdftex) $*
	$(pdftex) $*

.dvi.ps :
	$(dvips) -f -t letter $* > $@

all: resume.pdf references.pdf resume.html resume.docx

resume.ps: resume.cls resume.tex
references.ps: resume.cls references.tex
resume.pdf: resume.cls resume.tex
references.pdf: resume.cls references.tex

resume.docx : resume.tex
	$(pandoc) --from=latex --to=docx resume.tex -o resume.docx

resume.html : resume.tex
	$(pandoc) --from=latex --to=html resume.tex -o resume.html.0
	echo '<html><head><meta charset="UTF-8"></head><body>' > resume.html
	cat resume.html.0 >> resume.html
	echo '</body></html>' >> resume.html
	rm resume.html.0

clean:
	rm -f *.dvi *.log *.aux *.pdf

realclean:
	rm -f *.dvi *.log *.aux *.ps *.pdf

publish: resume.pdf
	echo BUG: publish target is not working since to migration away from godaddy
	#scp resume.pdf mooreb@mooreb.com:html/resume.pdf
	#scp resume.pdf brianmooreca@cirrussoftwarellc.com:www/resume.pdf

.PHONY: all clean realclean publish
