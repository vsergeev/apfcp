PROJECT=apfcp

all:
	rm -f $(PROJECT).toc $(PROJECT).aux $(PROJECT).log $(PROJECT).nav $(PROJECT).out $(PROJECT).pdf $(PROJECT).snm $(PROJECT).vrb texput.log
	PATH=pygments/:$(PATH) pdflatex -shell-escape $(PROJECT).tex
	PATH=pygments/:$(PATH) pdflatex -shell-escape $(PROJECT).tex
	mupdf $(PROJECT).pdf

clean:
	rm -f $(PROJECT).toc $(PROJECT).aux $(PROJECT).log $(PROJECT).nav $(PROJECT).out $(PROJECT).snm $(PROJECT).vrb texput.log
