execfile('petsc4py_mat.py')

# create linear solver,
ksp = PETSc.KSP()
ksp.create(PETSc.COMM_WORLD)

# use conjugate gradients method
ksp.setType('cg')
# and incomplete Cholesky
ksp.getPC().setType('icc')

# obtain sol & rhs vectors
x, b = A.getVecs()
x.set(0)
b.set(1)

# and next solve
ksp.setOperators(A)
ksp.setFromOptions()
ksp.solve(b, x)
