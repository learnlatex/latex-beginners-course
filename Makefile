################################################################
################################################################
# Makefile for 'LaTeX for Beginners' materials                 #
################################################################
################################################################

.SILENT:

################################################################
# Default with no target is to give help                       #
################################################################

help:
	@echo ""
	@echo " make all      - make all targets"
	@echo " make clean    - clean out directory"
	@echo " make handouts - make student handouts"
	@echo " make online   - make HTML version"
	@echo " make notes    - make tutor notes"
	@echo " make slides   - make slides"
	@echo ""
	
##############################################################
# Clean-up information                                       #
##############################################################

AUXFILES = \
	4ct  \
	4tc  \
	aux  \
	dvi  \
	idv  \
	lg   \
	log  \
	nav  \
	out  \
	snm  \
	toc  \
	tmp  \
	vrb  \
	xref 

CLEAN = \
	css  \
	gz   \
	html \
	pdf  \
	png  \
	svg
	
################################################################
# Standard file options                                        #
################################################################

%.pdf: %.tex
	NAME=`basename $< .tex` ; \
	echo "Typesetting $$NAME" ; \
	pdflatex -draftmode -interaction=nonstopmode $< > /dev/null ; \
	if [ $$? = 0 ] ; then  \
	  pdflatex -interaction=nonstopmode $< > /dev/null ; \
	fi
	for I in $(AUXFILES) ; do \
	  rm -f *.$$I ; \
	done
	
################################################################
# User make options                                            #
################################################################

.PHONY = \
	all      \
	clean    \
	handouts \
	online   \
	notes    \
	slides
	
all: handouts online notes slides
	
clean:
	echo "Cleaning up"
	for I in $(AUXFILES) ; do \
	  rm -f *.$$I ; \
	done
	for I in $(CLEAN) ; do \
	  rm -f *.$$I ; \
	done
	
handouts: handouts.pdf
	
online:
	echo "Typesetting HTML"
	htlatex online "online" > /dev/null
	for I in $(AUXFILES) ; do \
	  rm -f *.$$I ; \
	done
	
notes: tutornotes.pdf
	
slides: slides.pdf