program test_base
  use quaternion
  use tester
  implicit none

  type(tester_t) :: test
  double precision :: q1(4), q2(4), q3(4)

  call test%init()

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

  call test%print()

end program test_base
