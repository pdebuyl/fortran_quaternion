# fortran_quaternion

**Author:** Pierre de Buyl  
**License:** 3-clause BSD

`fortran_quaternion` is a Fortran module that provides some basic quaternion functions.

`fortran_quaternion` does not define any derived type, instead quaternions are provided as
4-element vectors storing the vector part first and the scalar part last.

- `qnorm`: return the norm.
- `qconj`: return the conjugate.
- `qinv`: return the inverse.
- `qmul_4`: return the product of two quaternions.
- `qmul_3`: return the product of a quaternion and a vector.

Tests are defined in `test/test_base.f90` and rely on
[fortran_tester](https://github.com/pdebuyl/fortran_tester).
