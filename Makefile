BASEDIR=.
INPUTDIR=$(BASEDIR)
OUTPUTDIR=$(BASEDIR)
# STYLEDIR=$(BASEDIR)/..
# TEMPLATEDIR=$(BASEDIR)/../pandoc-templates
LOGSDIR=$(BASEDIR)/logs

STYLEDIR=$(HOME)/Dropbox/diseno-tipografia/pandoc
TEMPLATEDIR=$(STYLEDIR)/pandoc-templates

BIBFILE=$(BASEDIR)/../books.bib


FILENAME=latex
FORMATFROM=markdown+yaml_metadata_block+raw_tex+example_lists+multiline_tables+grid_tables+fenced_divs+smart+native_divs+native_spans+fenced_code_attributes+citations+tex_math_dollars


# COLORBOLI="\#8e3456"
COLORBOLI="\#5a5865"
# COLORPAPEL="\#d0d4d7"
COLORPAPEL="\#e5e5e7"
# COLOROUTPUT="\#7692a9"
COLOROUTPUT="\#c4cad5"

FIGNAME=lan-09
EXTORIG=jpg
EXTDEST=png


CONTENTS=$(INPUTDIR)/latex.md



# webpage
html5:
	pandoc	$(CONTENTS) \
		--output $(OUTPUTDIR)/$(FILENAME).html \
		--filter pandoc-minted.py \
		--filter pandoc-citeproc \
		--standalone \
		--template $(TEMPLATEDIR)/default.$@ \
		--section-divs \
		--no-highlight \
		--mathjax \
		--toc \
		--from $(FORMATFROM) \
		--verbose
	sed -if '/<\/nav>/s/<\/nav>/<\/nav><article>/g' $(FILENAME).html ;
	sed -if '/<\/body>/s/<\/body>/<\/article><footer><\/footer><\/body>/g' $(FILENAME).html
	rm $(FILENAME).htmlf


fig-colors:
	magick convert figures/$(FIGNAME).$(EXTORIG) figures/$(FIGNAME).$(EXTDEST) 
	cp figures/$(FIGNAME).$(EXTDEST) figures/$(FIGNAME)-orig.$(EXTDEST) ; \
	convert -trim figures/$(FIGNAME)-orig.$(EXTDEST) figures/$(FIGNAME)-orig2.$(EXTDEST) ; \
	convert -transparent $(COLORPAPEL) -fuzz 15% figures/$(FIGNAME)-orig2.$(EXTDEST) figures/$(FIGNAME)-orig3.$(EXTDEST) ; \
	convert figures/$(FIGNAME)-orig3.$(EXTDEST) -fuzz 20% -fill $(COLOROUTPUT) -opaque $(COLORBOLI) figures/$(FIGNAME)-dark.$(EXTDEST) ; \
	rm figures/$(FIGNAME)-orig3.$(EXTDEST) ; \
	rm figures/$(FIGNAME)-orig2.$(EXTDEST) ; \
	rm figures/$(FIGNAME)-orig.$(EXTDEST)






# Está descuadrado a propósito para que aparezca bien a la salida
help:
	@echo '																				'
	@echo 'Makefile para la documentación reStructuredText con Pandoc					'
	@echo '																				'
	@echo 'Cómo usarlo:																	'
	@echo '	make			genera la salida en formato web moderno						'
	@echo '	make html5		hace exactamente lo mismo que make							'
	@echo '	make yml		genera el fichero YAML de metadatos 						'
	@echo '	make all		genera las salidas en todos los formatos					'
	@echo '	make clean		borra las salidas en todos los formatos						'
	@echo '	make pdf		genera la salida en PDF										'
	@echo '	make latex		genera la salida en LaTeX									'
	@echo '	make context		genera la salida en ConTeXt									'
	@echo '	make docx		genera la salida en formato DOCX							'
	@echo '	make rtf		genera la salida en formato RTF								'
	@echo '	make html4		genera la salida en formato web antiguo						'
	@echo '	make markdown		genera la salida en formato Markdown de Pandoc				'
	@echo '	make commonmark		genera la salida en formato Commonmark						'
	@echo '	make asciidoc		genera la salida en formato Asciidoc						'
	@echo '	make org		genera la salida en formato Org-mode						'
	@echo '	make mediawiki		genera la salida en formato Mediawiki						'
	@echo '	make epub3		genera la salida en formato Epub versión 3					'
	@echo '																				'
	@echo 'Obtenga los templates en local con pandoc -D latex/html/etc o los genéricos	'
	@echo 'de https://github.com/jgm/pandoc-templates									'


# all: html5 pdf latex context docx rtf html4 markdown commonmark asciidoc org mediawiki epub3
#
all: html5


clean:
	rm -rf otheroutputs
	rm -rf logs
	$(RM) $(FILENAME).html


yamlfile:
	touch $(FILENAME).yml
	echo '---' > $(FILENAME).yml
	echo 'fontenc: T1' >> $(FILENAME).yml
	echo 'papersize: a4' >> $(FILENAME).yml
	echo 'fontsize: 11pt' >> $(FILENAME).yml
	echo 'verbatim-in-note: true' >> $(FILENAME).yml
	echo 'strikeout: true' >> $(FILENAME).yml
	echo 'colorlinks: true' >> $(FILENAME).yml
	echo 'toccolor: black' >> $(FILENAME).yml
	echo 'links-as-notes: true' >> $(FILENAME).yml
	echo 'lang: es-ES' >> $(FILENAME).yml
	echo 'otherlangs: en-US' >> $(FILENAME).yml
	echo 'numbersections: true' >> $(FILENAME).yml
	echo 'geometry: left=4.3cm' >> $(FILENAME).yml
	echo 'geometry: right=4.3cm' >> $(FILENAME).yml
	echo 'title: ""' >> $(FILENAME).yml
	echo 'author: "Carlos E. Tafur Egido"' >> $(FILENAME).yml
	echo 'author-meta: "Carlos E. Tafur Egido"' >> $(FILENAME).yml
	echo 'date: 12/07/2018' >> $(FILENAME).yml
	echo 'date-meta: 12/07/2018' >> $(FILENAME).yml
	echo 'description: ""' >> $(FILENAME).yml
	echo 'documentclass: "article"' >> $(FILENAME).yml
	echo 'toc-depth: 3' >> $(FILENAME).yml
	echo 'css: $(STYLEDIR)/style-deep-light.css' >> $(FILENAME).yml
	echo 'link-citations: true' >> $(FILENAME).yml
	echo 'classoption: twoside' >> $(FILENAME).yml
	echo '---' >> $(FILENAME).yml
	echo '' >> $(FILENAME).yml


# PDF tamaño A4
pdf: metad.yml
	if [ ! -d logs ] ; \
		then mkdir logs ; \
	fi ;
	pandoc $(CONTENTS) \
		--output $(OUTPUTDIR)/$(FILENAME).$@ \
		--template=$(TEMPLATEDIR)/default.latex \
		--csl=$(STYLEDIR)/ref_format.csl \
		--pdf-engine=lualatex \
		--filter pandoc-citeproc \
		--standalone \
		--highlight-style=pygments \
		--include-in-header=../tex-preamble.tex \
		--listings \
		--wrap=none \
		--from $(FORMATFROM) \
		--verbose 2> $(LOGSDIR)/pandoc-$@.log ;
	if [ ! -d otheroutputs ] ; \
		then mkdir otheroutputs ; \
	fi ;
	mv $(FILENAME).$@ otheroutputs/


# # PDF para smartphone
# pdf-mb: $(FILENAME).yml
# 	pandoc	$^ \
# 			$(STYLEDIR)/metad-mb.yaml \
# 			$(CONTENTS) \
# 		--output $(OUTPUTDIR)/$(FILENAME).pdf \
# 		--template=$(TEMPLATEDIR)/default.latex \
# 		--include-in-header=$(STYLEDIR)/preamb-base.tex \
# 		--include-in-header=$(STYLEDIR)/preamb-$(DOCUMENTCLASS).tex \
# 		--include-in-header=$(STYLEDIR)/headings-nsec-y.tex \
# 		--bibliography=$(BIBFILE) 2>$(LOGSDIR)/pandoc-pdf-mb.log \
# 		--csl=$(STYLEDIR)/ref_format.csl \
# 		--highlight-style pygments \
# 		--latex-engine=xelatex \
# 		--toc \
# 		--standalone \
# 		--from $(MDFLAVOUR) \
# 		$(if $(NSEC),--number-sections ) \
# 		--verbose
# 	open $(FILENAME).pdf


# LaTeX
latex: $(FILENAME).yml
	if [ ! -d logs ] ; \
		then mkdir logs ; \
	fi ;
	pandoc $(CONTENTS) \
		--output $(OUTPUTDIR)/$(FILENAME).ltx \
		--template=$(TEMPLATEDIR)/default.$@ \
		--csl=$(STYLEDIR)/ref_format.csl \
		--pdf-engine=lualatex \
		--filter pandoc-citeproc \
		--standalone \
		--highlight-style=pygments \
		--include-in-header=../tex-preamble.tex \
		--listings \
		--wrap=none \
		--from $(FORMATFROM) \
		$(METAD) \
		--verbose 2> $(LOGSDIR)/pandoc-$@.log ;
	if [ ! -d otheroutputs ] ; \
		then mkdir otheroutputs ; \
	fi ;
	mv $(FILENAME).ltx otheroutputs/


# ConTeXt
context: $(FILENAME).yml
	if [ ! -d logs ] ; \
		then mkdir logs ; \
	fi ;
	pandoc $(CONTENTS) \
		--output $(OUTPUTDIR)/$(FILENAME).ctex \
		--template=$(TEMPLATEDIR)/default.$@ \
		--csl=$(STYLEDIR)/ref_format.csl \
		--pdf-engine=lualatex \
		--filter pandoc-citeproc \
		--standalone \
		--highlight-style=pygments \
		--include-in-header=../tex-preamble.tex \
		--listings \
		--wrap=none \
		--from $(FORMATFROM) \
		$(METAD) \
		--verbose 2> $(LOGSDIR)/pandoc-$@.log ;
	if [ ! -d otheroutputs ] ; \
		then mkdir otheroutputs ; \
	fi ;
	mv $(FILENAME).ctex otheroutputs/

# Microsoft Word DOCX
docx:
	if [ ! -d logs ] ; \
		then mkdir logs ; \
	fi ;
	pandoc $(CONTENTS) \
		--output $(OUTPUTDIR)/$(FILENAME).$@ \
		--template=$(TEMPLATEDIR)/default.opendocument \
		--csl=$(STYLEDIR)/ref_format.csl \
		--bibliography=$(BIBFILE) \
		--filter pandoc-citeproc \
		--standalone \
		--no-highlight \
		--from $(FORMATFROM) \
		--toc \
		--number-sections \
		$(METAD) \
		--verbose 2> $(LOGSDIR)/pandoc-$@.log ;
	if [ ! -d otheroutputs ] ; \
		then mkdir otheroutputs ; \
	fi ;
	mv $(FILENAME).$@ otheroutputs/


# RTF
rtf:
	if [ ! -d logs ] ; \
		then mkdir logs ; \
	fi ;
	pandoc $(CONTENTS) \
		--output $(OUTPUTDIR)/$(FILENAME).$@ \
		--template=$(TEMPLATEDIR)/default.$@ \
		--csl=$(STYLEDIR)/ref_format.csl \
		--bibliography=$(BIBFILE) \
		--filter pandoc-citeproc \
		--standalone \
		--no-highlight \
		--from $(FORMATFROM) \
		--toc \
		--number-sections \
		$(METAD) \
		--verbose 2> $(LOGSDIR)/pandoc-$@.log ;
	if [ ! -d otheroutputs ] ; \
		then mkdir otheroutputs ; \
	fi ;
	mv $(FILENAME).$@ otheroutputs/


# Web contecnologías antiguas
html4: $(FILENAME).yml
	if [ ! -d logs ] ; \
		then mkdir logs ; \
	fi ;
	pandoc $(CONTENTS) \
		--output $(OUTPUTDIR)/$(FILENAME)-legacy.html \
		--template=$(TEMPLATEDIR)/default.$@ \
		--filter pandoc-citeproc \
		--standalone \
		--no-highlight \
		--from $(FORMATFROM) \
		--toc \
		--wrap=none \
		--number-sections \
		--katex \
		$(METAD) \
		--verbose 2> $(LOGSDIR)/pandoc-$@.log
	if [ ! -d otheroutputs ] ; \
		then mkdir otheroutputs ; \
	fi ;
	mv $(FILENAME)-legacy.html otheroutputs/

# Markdown (sabor de Pandoc)
markdown: $(FILENAME).yml
	if [ ! -d logs ] ; \
		then mkdir logs ; \
	fi ;
	pandoc $(CONTENTS) \
		--output $(OUTPUTDIR)/$(FILENAME).mkd \
		--template=$(TEMPLATEDIR)/default.$@ \
		--filter pandoc-citeproc \
		--from $(FORMATFROM) \
		$(METAD) \
		--verbose 2> $(LOGSDIR)/pandoc-$@.log
	if [ ! -d otheroutputs ] ; \
		then mkdir otheroutputs ; \
	fi ;
	mv $(FILENAME).mkd otheroutputs/


# Commonmark
commonmark: $(FILENAME).yml
	if [ ! -d logs ] ; \
		then mkdir logs ; \
	fi ;
	pandoc $(CONTENTS) \
		--output $(OUTPUTDIR)/$(FILENAME).md \
		--template=$(TEMPLATEDIR)/default.$@ \
		--filter pandoc-citeproc \
		--from $(FORMATFROM) \
		$(METAD) \
		--verbose 2> $(LOGSDIR)/pandoc-$@.log
	if [ ! -d otheroutputs ] ; \
		then mkdir otheroutputs ; \
	fi ;
	mv $(FILENAME).md otheroutputs/


# Asciidoc
asciidoc: $(FILENAME).yml
	if [ ! -d logs ] ; \
		then mkdir logs ; \
	fi ;
	pandoc $(CONTENTS) \
		--output $(OUTPUTDIR)/$(FILENAME).$@ \
		--template=$(TEMPLATEDIR)/default.$@ \
		--filter pandoc-citeproc \
		--from $(FORMATFROM) \
		$(METAD) \
		--verbose 2> $(LOGSDIR)/pandoc-$@.log
	if [ ! -d otheroutputs ] ; \
		then mkdir otheroutputs ; \
	fi ;
	mv $(FILENAME).$@ otheroutputs/


# Org-mode
org: $(FILENAME).yml
	if [ ! -d logs ] ; \
		then mkdir logs ; \
	fi ;
	pandoc $(CONTENTS) \
		--output $(OUTPUTDIR)/$(FILENAME).$@ \
		--template=$(TEMPLATEDIR)/default.$@ \
		--filter pandoc-citeproc \
		--from $(FORMATFROM) \
		$(METAD) \
		--verbose 2> $(LOGSDIR)/pandoc-$@.log
	if [ ! -d otheroutputs ] ; \
		then mkdir otheroutputs ; \
	fi ;
	mv $(FILENAME).$@ otheroutputs/


# Mediawiki
mediawiki: $(FILENAME).yml
	if [ ! -d logs ] ; \
		then mkdir logs ; \
	fi ;
	pandoc $(CONTENTS) \
		--output $(OUTPUTDIR)/$(FILENAME).$@ \
		--template=$(TEMPLATEDIR)/default.$@ \
		--filter pandoc-citeproc \
		--from $(FORMATFROM) \
		$(METAD) \
		--verbose 2> $(LOGSDIR)/pandoc-$@.log
	if [ ! -d otheroutputs ] ; \
		then mkdir otheroutputs ; \
	fi ;
	mv $(FILENAME).$@ otheroutputs/


# Epub versión 3
epub3: $(FILENAME).yml
	if [ ! -d logs ] ; \
		then mkdir logs ; \
	fi ;
	pandoc $(CONTENTS) \
		--output $(OUTPUTDIR)/$(FILENAME).epub \
		--template=$(TEMPLATEDIR)/default.$@ \
		--filter pandoc-citeproc \
		--toc \
		--from $(FORMATFROM) \
		$(METAD) \
		--verbose 2> $(LOGSDIR)/pandoc-$@.log
	if [ ! -d otheroutputs ] ; \
		then mkdir otheroutputs ; \
	fi ;
	mv $(FILENAME).epub otheroutputs/






		# --csl=$(STYLEDIR)/ref_format.csl \












.PHONY: help pdf docx html tex



