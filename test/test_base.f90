! This file is part of fortran_quaternion
! Author: Pierre de Buyl http://pdebuyl.be/
! License: BSD 3-clause

program test_base
  use quaternion
  use tester
  implicit none

  type(tester_t) :: test
  double precision :: q1(4), q2(4), q3(4)
  double precision :: v1(3), v2(3)

  call test%init()

  write(*,*) 'Testing the basic relations i**2=-1, etc'

  q1 = [1, 0, 0, 0]
  q3 = [0, 0, 0, -1]

  call test% assert_close(qmul_4(q1, q1), q3)

  q1 = [0, 1, 0, 0]
  q3 = [0, 0, 0, -1]

  call test% assert_close(qmul_4(q1, q1), q3)

  q1 = [0, 0, 1, 0]
  q3 = [0, 0, 0, -1]

  call test% assert_close(qmul_4(q1, q1), q3)

  write(*,*) 'Testing the basic relations ij=k, ji=-k, etc'

  q1 = [1, 0, 0, 0]
  q2 = [0, 1, 0, 0]
  q3 = [0, 0, 1, 0]

  call test% assert_close(qmul_4(q1, q2), q3)

  q1 = [0, 1, 0, 0]
  q2 = [0, 0, 1, 0]
  q3 = [1, 0, 0, 0]

  call test% assert_close(qmul_4(q1, q2), q3)

  q1 = [0, 0, 1, 0]
  q2 = [1, 0, 0, 0]
  q3 = [0, 1, 0, 0]

  call test% assert_close(qmul_4(q1, q2), q3)

  q1 = [1, 0, 0, 0]
  q2 = [0, 0, 1, 0]
  q3 = [0, -1, 0, 0]

  call test% assert_close(qmul_4(q1, q2), q3)

  q1 = [0, 1, 0, 0]
  q2 = [1, 0, 0, 0]
  q3 = [0, 0, -1, 0]

  call test% assert_close(qmul_4(q1, q2), q3)

  q1 = [0, 0, 1, 0]
  q2 = [0, 1, 0, 0]
  q3 = [-1, 0, 0, 0]

  call test% assert_close(qmul_4(q1, q2), q3)

  write(*,*) 'Testing the inverse quaternion'

  q1 = [1, 2, 3, 4]
  q2 = qinv(q1)
  q3 = [0, 0, 0, 1]

  call test% assert_close(qmul_4(q1,q2), q3)

  write(*,*) 'Testing the other functions of the module'

  q1 = [1, 0, 0, 0]
  call test% assert_close(qnorm(q1), 1.d0)

  q1 = [1, 0, 0, 1]
  call test% assert_close(qnorm(q1), sqrt(2.d0))

  q1 = [2, 0, 0, 1]
  q2 = [-2, 0, 0, 1]
  call test% assert_close(qconj(q1), q2)

  q1 = [0, 1, 1, -2]
  v1 = [1, 2, 3]
  v2 = -2*v1 + cross(q1(1:3), v1)
  call test% assert_close(qmul_3(q1, v1), v2)

  call test%print()

end program test_base
