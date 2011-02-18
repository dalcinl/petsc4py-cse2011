all: slides

slides:
	pdflatex -interaction=batchmode -shell-escape cse2011.tex
	pdflatex -interaction=batchmode -shell-escape cse2011.tex

clean:
	${RM} *.aux *.log *.fls *.nav *.snm *.out *.toc *.vrb *.pyg

distclean: clean
	${RM} cse2011.pdf
	${RM} .sconsign.dblite
