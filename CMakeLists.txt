cmake_minimum_required(VERSION 2.6)

Project(fortran_quaternion Fortran)

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/modules)
enable_testing()
add_subdirectory(fortran_tester)

add_library(quaternion
src/quaternion.f90)

add_executable(test_base
test/test_base.f90)
target_link_libraries(test_base quaternion fortran_tester)

add_executable(test_conversion
test/test_conversion.f90)
target_link_libraries(test_conversion quaternion fortran_tester)

add_test(NAME test_base COMMAND test_base)
add_test(NAME test_conversion COMMAND test_conversion)
