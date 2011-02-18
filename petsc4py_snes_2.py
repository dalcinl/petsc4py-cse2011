# create  nonlinear solver
snes = PETSc.SNES().create()
# register the function in charge of
# computing the nonlinear residual
f = PETSc.Vec().createSeq(m*n)
snes.setFunction(Bratu2D, f,
                 args=(alpha, m, n))

# configure the nonlinear solver
# to use a matrix-free Jacobian
snes.setUseMF(True)
snes.getKSP().setType('cg')
snes.setFromOptions()

# solve the nonlinear problem
b = None # rhs = 0
x = f.duplicate() # solution
snes.solve(b, x)
