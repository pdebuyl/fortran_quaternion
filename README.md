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

## Example programs

1. Multiplication of two quaternions

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

2. Rotation of a 3d vector about a given axis

Here, the vector `v` is first stored in the vector part of the quaternion `qv`

~~~.f90
program quaternion_usage
  use quaternion
  implicit none

  double precision :: q(4), qv(4), v(3)
  double precision :: axis(3), theta

  axis = [ 1, 1, 0 ]
  axis = axis / norm2(axis)

  theta = 2*atan(1.d0) ! pi/2

  q(1:3) = sin(theta/2)*axis
  q(4) = cos(theta/2)

  v = [0, 0, 1]
  qv(1:3) = v
  qv(4) = 0

  write(*,'(a,3f7.2)') 'v = ', v
  ! Rotate qv by q
  qv = qmul(q, qmul(qv, qconj(q)))
  ! Keep only the vector part
  v = qv(1:3)
  write(*,'(a,3f7.2)') 'rotated v = ', v

end program quaternion_usage
~~~


## Tests


Tests are defined in `test/test_base.f90` and rely on
[fortran_tester](https://github.com/pdebuyl/fortran_tester).
