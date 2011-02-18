include "cython.pxi"

cdef class Vec:
    cdef PetscVec vec
    ...
    def dot(self, Vec other):
        cdef PetscScalar val
        ierr = VecDot(self.vec, other.vec, &val); CHKERR(ierr)
        return val
...
cdef class Mat:
    cdef PetscMat mat
    ...
    def mult(self, Vec x, Vec y):
        ierr = MatMult(self.mat, x.vec, y.vec); CHKERR(ierr)
...
cdef class KSP:
    cdef PetscKSP ksp
    ...
    def solve(self, Vec b, Vec x):
        ierr = KSPSolve(self.ksp, b.vec, x.vec); CHKERR(ierr)
