! This file is part of fortran_quaternion
! Author: Pierre de Buyl http://pdebuyl.be/
! License: BSD 3-clause

program test_rotation
  use quaternion
  use tester
  implicit none

  type(tester_t) :: test
  double precision :: q(4)
  double precision :: theta
  double precision, parameter :: pi = 4.d0*atan(1.d0)
  double precision, parameter :: one_x(3) = [1, 0, 0]
  double precision, parameter :: one_y(3) = [0, 1, 0]
  double precision, parameter :: one_z(3) = [0, 0, 1]

  call test%init()

  write(*,*) 'Testing the rotation operator using quaternions'

  write(*,*) 'Rotation about the x-axis'

  theta = pi/2
  q = qnew(s=cos(theta/2), v=sin(theta/2)*one_x)

  call test% assert_close(qrot(q, one_y), one_z)
  call test% assert_close(qrot(q, one_z), -one_y)

  theta = pi
  q = qnew(s=cos(theta/2), v=sin(theta/2)*one_x)

  call test% assert_close(qrot(q, one_x), one_x)
  call test% assert_close(qrot(q, one_y), -one_y)
  call test% assert_close(qrot(q, one_z), -one_z)

  write(*,*) 'Rotation about the y-axis'

  theta = pi/2
  q = qnew(s=cos(theta/2), v=sin(theta/2)*one_y)

  call test% assert_close(qrot(q, one_z), one_x)
  call test% assert_close(qrot(q, one_x), -one_z)

  theta = pi
  q = qnew(s=cos(theta/2), v=sin(theta/2)*one_y)

  call test% assert_close(qrot(q, one_x), -one_x)
  call test% assert_close(qrot(q, one_y), one_y)
  call test% assert_close(qrot(q, one_z), -one_z)

  write(*,*) 'Rotation about the z-axis'

  theta = pi/2
  q = qnew(s=cos(theta/2), v=sin(theta/2)*one_z)

  call test% assert_close(qrot(q, one_x), one_y)
  call test% assert_close(qrot(q, one_y), -one_x)

  theta = pi
  q = qnew(s=cos(theta/2), v=sin(theta/2)*one_z)

  call test% assert_close(qrot(q, one_x), -one_x)
  call test% assert_close(qrot(q, one_y), -one_y)
  call test% assert_close(qrot(q, one_z), one_z)

  call test%print()

end program test_rotation
