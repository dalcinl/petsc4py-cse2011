%module MyPDE

%include petsc4py/petsc4py.i

%{ 
#include "MyPDE.h" 
%}

typedef struct Params {
  double alpha;
  double beta;
  double gamma;
} Params;

PetscErrorCode FormInitGuess(DA da, Vec x, Params *p);
PetscErrorCode FormFunction(DA da, Vec x, Vec F, Params *p);
PetscErrorCode FormJacobian(DA da, Vec x, Mat J, Params *p);
