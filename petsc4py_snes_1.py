from petsc4py import PETSc
from numpy import exp

m, n = 32, 32 # grid sizes
alpha = 6.8   # parameter

def Bratu2D(snes, X, F, alpha, m, n):
    # NumPy array <- Vec
    x = X.array.reshape(m, n)
    f = F.array.reshape(m, n)
    # setup 5-points stencil
    u  = x[1:-1, 1:-1] # center
    uN = x[1:-1,  :-2] # north
    uS = x[1:-1, 2:  ] # south
    uW = x[ :-2, 1:-1] # west
    uE = x[2:,   1:-1] # east
    # compute nonlinear function
    hx = 1.0/(m-1) # x grid spacing
    hy = 1.0/(n-1) # y grid spacing
    f[:,:] = x
    f[1:-1, 1:-1] = \
         (2*u - uE - uW) * (hy/hx) \
       + (2*u - uN - uS) * (hx/hy) \
       - alpha * exp(u)  * (hx*hy)
