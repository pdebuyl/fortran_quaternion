! This file is part of fortran_quaternion
! Author: Pierre de Buyl http://pdebuyl.be/
! License: BSD 3-clause

program test_base
  use quaternion
  use tester
  implicit none

  type(tester_t) :: test
  double precision :: q(4)
  double precision :: v(3)
  double precision :: s

  call test%init()

  write(*,*) 'Testing the conversion between scalars, vectors and quaternions'

  v = [10, 11, 12]
  q = qnew(v=v)
  call test% assert_close(v, qvector(q))
  call test% assert_close(0.d0, qscalar(q))

  s = 1.201d0
  q = qnew(s=s)
  call test% assert_close([0.d0, 0.d0, 0.d0], qvector(q))
  call test% assert_close(s, qscalar(q))

  s = -1234.56d0
  v = [0.d0, 100.d0, 5.d0]
  q = qnew(s=s, v=v)
  call test% assert_close(v, qvector(q))
  call test% assert_close(s, qscalar(q))

  s = 0
  v = 0
  q = qnew()
  call test% assert_close(v, qvector(q))
  call test% assert_close(0.d0, qscalar(q))

  call test%print()

end program test_base
