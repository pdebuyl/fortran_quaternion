cmake_minimum_required(VERSION 2.6)

Project(fortran_quaternion Fortran)

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/modules)

add_library(quaternion src/quaternion.f90)

if(BUILD_TESTING)
  enable_testing()
  add_subdirectory(test)
endif()

