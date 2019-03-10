.PHONY: all
all:
	$(info Generating the JDF PDF.)
	pdflatex main
	bibtex main
	python enumerate-refs.py
	pdflatex main
	pdflatex main
