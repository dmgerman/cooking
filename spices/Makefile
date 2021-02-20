HTMLDIR = /home/dmg/public_html/temp
ADDRESS = dmg@csg.uwaterloo.ca

default: spices.dvi

spices.dvi: spices.tex spices.bbl
	latex spices.tex
	touch spices.dvi

spices.bbl: spices.bib
	bibtex spices
	touch spices.bbl

spices/spices.html: spices.dvi
#	rcp spices.tex spices.bbl spices.bib spices.aux spices.blg dmorales@neumann.uwaterloo.ca:faqs/spices
#	rsh neumann -l dmorales "cd faqs/spices;/u/alopez-o/l2h/l2h -split 1 -show_section_numbers spices.tex
#	rcp  dmorales@neumann.uwaterloo.ca:faqs/spices/spices/spices.html html-spices.html
	/home/dmg/bin/l2h -t "Flavouring the World. The FAQ about Spices"  -init_file /home/dmg/.latex2html-init-english -reuse -info 0 -split 3 spices.tex 
	cp spices/*.html /home/dmg/public_html/faqs/spices/
	cp spices/*.gif /home/dmg/public_html/faqs/spices/
	chmod -R go+r /home/dmg/public_html/faqs/spices

spicestext/spices/spices.html: spices.dvi
#	rcp -p spices.tex spices.bbl spices.bib spices.aux spices.blg new.sh dmorales@neumann.uwaterloo.ca:faqs/spices
#	rsh neumann -l dmorales faqs/spices/new.sh
#	rcp  dmorales@neumann.uwaterloo.ca:faqs/spices/spices/spices.html spicestext/spices/spices.html
#	/home/dmg/bin/l2h -ascii_mode -address $(ADDRESS) -split 3 -info 0 -show_section_numbers -dir spicestext -reuse spices.tex 
	/home/dmg/bin/l2h -ascii_mode -address $(ADDRESS) -info 0 -show_section_numbers -dir spicestext -reuse -split 0 spices.tex 
	chmod -R go+r spicestext/spices

spices.raw: $(HTMLDIR)/spices-text.html
#	cp $(HTMLDIR)/spices-text.html /home/dmg/public_html/temp/
	chmod go+r $(HTMLDIR)/spices-text.html
	lynx -dump "http://csg/~dmg/temp/spices-text.html" > spices.raw

$(HTMLDIR)/spices-text.html: spicestext/spices/spices.html
	./filtra_html.pl spicestext/spices/spices.html > $(HTMLDIR)/spices-text.html
	chmod -R go+r /home/dmg/public_html/faqs/spices

spices.txt: spices.raw filtra_faq.pl
	./filtra_faq.pl spices.raw > spices.txt
#	cp spices.raw spices.txt	

install-text: $(HTMLDIR)/spices-text.html

install-html: $(HTMLDIR/spices.html

spices.txt.asc: spices.txt
	pgp -sta spices.txt 

spices.posting: spices.txt.asc header.final
	cat header.final spices.txt.asc  > spices.posting


header.final: spices.txt make-header.pl
	./make-header.pl> header.final 

install: $(HTMLDIR)/spices-text.html $(HTMLDIR)/spices.html

clean-html: 
	rm -r $(HTMLDIR)/*


$(HTMLDIR)/spices.html: spices/spices.html
	cp -r spices/*.html $(HTMLDIR)/
	cp -r spices/*.gif $(HTMLDIR)/
	./filtra_html.pl spices/spices.html > $(HTMLDIR)/spices.html
	cp index.source $(HTMLDIR)/index.html
	chmod -R go+r /home/dmg/public_html/faqs/spices

reid:
	cd spices; cp *.html ~/public_html/faqs/spices/

clean: 
	cd /home/dmg/faqs/spices
	rm spices.bbl spices.blg spices.aux *.html *.txt *~ *.raw

index.html: index.source
	cp index.source $(HTMLDIR)/index.html
