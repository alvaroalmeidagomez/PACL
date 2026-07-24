===============================================================================
      PROJECT FUNDED BY THE CENTRO DE MODELAMIENTO MATEMÁTICO (CMM),
                            SANTIAGO, CHILE
===============================================================================

PROJECT TITLE
-------------
Numerical Verification of the Heat Equation for Differential 1-Forms
on the Unit 2-Sphere

OVERVIEW
--------
This project presents a numerical verification of the heat equation for
differential 1-forms on the two-dimensional unit sphere (S²) using the
projected ambient connection Laplacian. Differential 1-forms are represented
by their corresponding differential arrays, allowing the heat equation to be
solved through a matrix-based numerical scheme.

The implementation is written in MATLAB and reproduces the numerical
experiment presented in the accompanying manuscript.

DIRECTORY STRUCTURE
-------------------
The project consists of a single main directory containing the complete
implementation for the following numerical experiment:

1. V1: Projected Tangent Vector Field
   Initial vector field:
       V1(x,y,z) = (1,1,1) - <(1,1,1),(x,y,z)> (x,y,z)

   This vector field is obtained by orthogonally projecting the constant
   vector (1,1,1) onto the tangent space of the unit sphere at each point.
   It serves as the initial condition for the numerical solution of the
   heat equation.

TECHNICAL INFORMATION
---------------------
Software
    MATLAB R2017b

Input Data
    VF.mat
        Contains the initial tangent vector field used in the numerical
        simulations.

NUMERICAL METHOD
----------------
The heat equation is solved using the projected ambient connection
Laplacian together with an explicit Euler time-stepping scheme. The
numerical solution evolves the differential 1-form associated with the
initial tangent vector field.

ACKNOWLEDGEMENTS
----------------
This work was supported by the Centro de Modelamiento Matemático (CMM)
through the ANID Basal Program for Centers of Excellence,
Grant FB210005 (Chile).

===============================================================================
