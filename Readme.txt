===============================================================================
      PROJECT FUNDED BY THE CENTRO DE MODELAMIENTO MATEMÁTICO (CMM),
                            SANTIAGO, CHILE
===============================================================================

PROJECT TITLE
-------------
Numerical Verification of the Heat Equation for Differential 1-Forms
on the Unit 2-Sphere

DESCRIPTION
-----------
This project provides a numerical verification of the heat equation for
differential 1-forms on the two-dimensional unit sphere using the
projected ambient connection Laplacian. Differential 1-forms are
represented through their corresponding differential arrays.

The project consists of a single main directory containing the numerical
implementation for the following initial vector field:

1. V1: Killing Vector Field
   Initial vector field:
       V1(x,y,z) = (-y, x, 0)

   This is a Killing vector field generating rotations about the z-axis.

TECHNICAL NOTES
---------------
- Software: MATLAB R2017b.
- The numerical implementation is organized around the initial vector field,
  which is stored in the file `VF.mat`.

ACKNOWLEDGEMENTS
----------------
This work was supported by the Centro de Modelamiento Matemático (CMM),
through the ANID Basal Program for Centers of Excellence,
Grant FB210005 (Chile).

===============================================================================
