# fortran_quaternion

**Author:** Pierre de Buyl  
**License:** 3-clause BSD

`fortran_quaternion` is a Fortran module that provides some basic quaternion functions.

`fortran_quaternion` does not define any derived type, instead quaternions are provided as
4-element vectors storing the vector part first and the scalar part last.

- `qnorm`: return the norm.
- `qnormalize`: return the normalized quaternion.
- `qconj`: return the conjugate.
- `qinv`: return the inverse.
- `qmul`: return the product of two quaternions.
- `qmul_3`: return the product of a quaternion and a vector.
- `cross`: return the cross product of two vectors.

~~~.f90
program quaternion_usage
  use quaternion
  implicit none

  double precision :: q1(4), q2(4)

  q1 = [1, 2, 3, 4]
  q2 = [5, 6, 7, 8]

  write(*,'(4f5.2,a,4f5.2)') q1, ' x ', q2
  write(*,'(a,4f7.2)') '= ', qmul(q1, q2)

end program quaternion_usage
~~~

Tests are defined in `test/test_base.f90` and rely on
[fortran_tester](https://github.com/pdebuyl/fortran_tester).
