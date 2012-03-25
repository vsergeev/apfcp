PROJECT=apfcp

# Note: I modified the default pygments objdump lexer to syntax highlight
# objdump output without expecting tabs (\t) on each line, so I could fit
# source examples into the slides.
#
# The modifications are contained in hg diff pygments_objdump_mods.diff

all:
	rm -f $(PROJECT).toc $(PROJECT).aux $(PROJECT).log $(PROJECT).nav $(PROJECT).out $(PROJECT).pdf $(PROJECT).snm $(PROJECT).vrb texput.log
	PATH=pygments/:$(PATH) pdflatex -shell-escape $(PROJECT).tex
	PATH=pygments/:$(PATH) pdflatex -shell-escape $(PROJECT).tex
	mupdf $(PROJECT).pdf

clean:
	rm -f $(PROJECT).toc $(PROJECT).aux $(PROJECT).log $(PROJECT).nav $(PROJECT).out $(PROJECT).snm $(PROJECT).vrb texput.log
