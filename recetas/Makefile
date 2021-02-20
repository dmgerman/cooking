LATEX2HTML = /usr/local/src/latex2html/latex2html

default: recetas.dvi Makefile
	$(LATEX2HTML) -init_file latex2html-init recetas.tex 
	chmod -R go+r recetas 

html:
	cd recetas;cp -p *.html ~/public_html/recipes/mexico/spanish

install:
	cd recetas;scp  *.html dmg@csgrs6k1.uwaterloo.ca:~/public_html/recipes/mexico/spanish


recetas.dvi: recetas.tex recetas.bbl
	latex recetas.tex
	touch recetas.dvi

recetas.bbl: recetas.bib
	bibtex recetas
	touch recetas.bbl


clean:
	rm recetas/*.html
