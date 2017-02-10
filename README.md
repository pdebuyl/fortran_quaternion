# fortran_quaternion

**Author:** Pierre de Buyl  
**License:** 3-clause BSD

`fortran_quaternion` is a Fortran module that provides some basic quaternion functions.

`fortran_quaternion` does not define any derived type, instead quaternions are provided as
4-element vectors storing the vector part first and the scalar part last.

- `qnew`: return a quaternion from the scalar and vector input.
- `quaternion_to_vector`: return the vector part of a quaternion.
- `quaternion_to_scalar`: return the scalar part of a quaternion.
- `qnorm`: return the norm.
- `qnormalize`: return the normalized quaternion.
- `qconj`: return the conjugate.
- `qinv`: return the inverse.
- `qmul`: return the product of two quaternions.


## Example programs

### Multiplication of two quaternions

~~~.f90
program quaternion_usage
  use quaternion
  implicit none

  double precision :: q1(4), q2(4)

  q1 = qnew(v=[1.d0, 2.d0, 3.d0], s=4.d0)
  q2 = qnew(v=[6.d0, 7.d0, 8.d0], s=5.d0)

  write(*,'(4f5.2,a,4f5.2)') q1, ' x ', q2
  write(*,'(a,4f7.2)') '= ', qmul(q1, q2)

end program quaternion_usage
~~~

### Rotation of a 3d vector about a given axis

~~~.f90
program quaternion_rotation
  use quaternion
  implicit none

  double precision :: q(4), v(3)
  double precision :: axis(3), theta

  axis = [ 1, 1, 0 ]
  theta = 2*atan(1.d0) ! pi/2

  q = qnew(s=cos(theta/2), v=sin(theta/2)*axis/norm2(axis))

  v = [0, 0, 1]

  write(*,'(a,3f7.2)') 'v = ', v
  ! Rotate qv by q
  v = quaternion_to_vector(qmul(q, qmul(qnew(v=v), qconj(q))))
  write(*,'(a,3f7.2)') 'rotated v = ', v

end program quaternion_rotation
~~~


## Tests

Tests are defined in `test/test_base.f90` and rely on
[fortran_tester](https://github.com/pdebuyl/fortran_tester).
