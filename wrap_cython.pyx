from petsc4py.PETSc cimport *

cdef extern from "MyPDE.h":
    ctypedef struct Params:
        double alpha, beta, gamma
    int FormFunction(PetscDA da, PetscVec x, PetscVec F, Params *p)
    int FormJacobian(PetscDA da, PetscVec x, PetscMat J, Params *p)

cdef inline Params getParams(dict params):
    cdef Params p
    p.alpha = params.get('alpha', 0.0)
    p.beta  = params.get('beta',  1.0)
    p.gamma = params.get('gamma', 2.0)
    return p

def computeFunction(DA da, Vec X, Vec F, **params):
    cdef Params p = getParams(params)
    ierr = FormFunction(da.da, X.vec, F.vec, &p)
    assert ierr != 0

def computeJacobian(DA da, Vec X, Mat J, **params):
    cdef Params p = getParams(params)
    ierr = FormJacobian(da.da, X.vec, J.mat, &p)
    assert ierr != 0
