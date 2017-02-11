! This file is part of fortran_quaternion
! Author: Pierre de Buyl http://pdebuyl.be/
! License: BSD 3-clause

module quaternion
  implicit none

  private

  public :: qnorm, qnormalize, qconj, qinv, qmul
  public :: qvector, qscalar, qnew

contains

  !! Construct a new quaternion from the scalar part s and the vector part v
  pure function qnew(s, v) result(q)
    double precision, intent(in), optional :: s
    double precision, intent(in), optional :: v(3)
    double precision :: q(4)

    if (present(s)) then
       q(4) = s
    else
       q(4) = 0
    end if

    if (present(v)) then
       q(1:3) = v
    else
       q(1:3) = 0
    end if

  end function qnew

  !! Return the vector part of a quaternion
  pure function qvector(q) result(v)
    double precision, intent(in) :: q(4)
    double precision :: v(3)

    v = q(1:3)

  end function qvector

  !! Return the scalar part of a quaternion
  pure function qscalar(q) result(s)
    double precision, intent(in) :: q(4)
    double precision :: s

    s = q(4)

  end function qscalar

  !! Return the norm of quaternion
  pure function qnorm(q) result(n)
    double precision, intent(in) :: q(4)
    double precision :: n

    n = norm2(q)

  end function qnorm

  !! Return normalized quaternion
  pure function qnormalize(q) result(r)
    double precision, intent(in) :: q(4)
    double precision :: r(4)

    double precision :: n

    n = qnorm(q)
    r = q/n
  end function qnormalize

  !! Return conjugate quaternion
  pure function qconj(q) result(n)
    double precision, intent(in) :: q(4)
    double precision :: n(4)

    n(1) = -q(1)
    n(2) = -q(2)
    n(3) = -q(3)
    n(4) = q(4)

  end function qconj

  !! Return cross product between two 3d vectors
  pure function cross(x1, x2) result(r)
    double precision, intent(in) :: x1(3), x2(3)
    double precision :: r(3)

    r(1) = x1(2)*x2(3) - x1(3)*x2(2)
    r(2) = x1(3)*x2(1) - x1(1)*x2(3)
    r(3) = x1(1)*x2(2) - x1(2)*x2(1)

  end function cross

  !! Return inverse quaterion
  pure function qinv(q) result(n)
    double precision, intent(in) :: q(4)
    double precision :: n(4)

    n(1) = -q(1)
    n(2) = -q(2)
    n(3) = -q(3)
    n(4) = q(4)

    n = n / dot_product(n, n)

  end function qinv

  !! Return the product of two quaternions
  pure function qmul(q1, q2) result(r)
    double precision, intent(in) :: q1(4)
    double precision, intent(in) :: q2(4)
    double precision :: r(4)

    r(1:3) = q1(4)*q2(1:3) + q2(4)*q1(1:3) + cross(q1(1:3), q2(1:3))
    r(4) = q1(4)*q2(4) - dot_product(q1(1:3), q2(1:3))

  end function qmul

end module quaternion
