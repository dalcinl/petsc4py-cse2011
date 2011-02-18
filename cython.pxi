cdef import from "petsc.h":

    ctypedef int   PetscInt
    ctypedef float PetscScalar

    ctypedef void* PetscVec "Vec"
    ctypedef void* PetscMat "Mat"
    ctypedef void* PetscKSP "KSP"

    int VecDot(PetscVec x,PetscVec y, PetscScalar *val)
    int MatMult(PetscMat A, PetscVec x, PetscVec y)
    int KSPSolve(PetscKSP ksp, PetscVec b, PetscVec x)

cdef inline int CHKERR(int ierr) except -1:
    if ierr != 0:
        raise RuntimeError("error code %d" % ierr)
    return 0
