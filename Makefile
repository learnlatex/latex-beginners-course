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
	@echo " make all    - make all targets"
	@echo " make clean  - clean out directory"
	@echo " make slides - make slides"
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
	png
	
################################################################
# User make options                                            #
################################################################

.PHONY = \
	all   \
	clean \
	slides
	
all: slides
	
clean:
	echo "Cleaning up"
	for I in $(AUXFILES) ; do \
	  rm -f *.$$I ; \
	done
	for I in $(CLEAN) ; do \
	  rm -f *.$$I ; \
	done
	
slides: