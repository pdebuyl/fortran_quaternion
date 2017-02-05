module quaternion
  implicit none

contains

  pure function qnorm(q) result(n)
    double precision, intent(in) :: q(4)
    double precision :: n

    n = norm2(q)

  end function qnorm

  pure function qconj(q) result(n)
    double precision, intent(in) :: q(4)
    double precision :: n(4)

    n(1) = -q(1)
    n(2) = -q(2)
    n(3) = -q(3)
    n(4) = q(4)

  end function qconj

  pure function cross(x1, x2) result(r)
    double precision, intent(in) :: x1(3), x2(3)
    double precision :: r(3)

    r(1) = x1(2)*x2(3) - x1(3)*x2(2)
    r(2) = x1(3)*x2(1) - x1(1)*x2(3)
    r(3) = x1(1)*x2(2) - x1(2)*x2(1)

  end function cross

  pure function qinv(q) result(n)
    double precision, intent(in) :: q(4)
    double precision :: n(4)

    n(1) = -q(1)
    n(2) = -q(2)
    n(3) = -q(3)
    n(4) = q(4)

    n = n / dot_product(n, n)

  end function qinv

  pure function qmul_3(q, v) result(r)
    double precision, intent(in) :: q(4)
    double precision, intent(in) :: v(3)
    double precision :: r(3)

    r = q(4)*v + cross(q(1:3), v)

  end function qmul_3

  pure function qmul_4(q1, q2) result(r)
    double precision, intent(in) :: q1(4)
    double precision, intent(in) :: q2(4)
    double precision :: r(4)

    r(1:3) = q1(4)*q2(1:3) + q2(4)*q1(1:3) + cross(q1(1:3), q2(1:3))
    r(4) = q1(4)*q2(4) - dot_product(q1(1:3), q2(1:3))

  end function qmul_4

end module quaternion
