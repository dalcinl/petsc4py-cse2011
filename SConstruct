env = Environment()

# # hack to build '.tex' files with 'pdflatex'
#from SCons.Action import Action
#PDFLaTeXAction = Action('$PDFLATEXCOM')
#env['BUILDERS']['PDF'].add_action('.tex',PDFLaTeXAction)

env['PDFLATEXFLAGS'].append('-shell-escape')
pdf = env.PDF('cse2011.tex')

# Local Variables:
# mode: Python
# End:
