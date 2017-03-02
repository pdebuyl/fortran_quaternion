add_subdirectory(fortran_tester)

foreach(test_name test_base test_conversion test_rotation)
  add_executable(${test_name} ${test_name}.f90)
  target_link_libraries(${test_name} quaternion fortran_tester)
  add_test(NAME ${test_name} COMMAND ${test_name})
endforeach(test_name)

