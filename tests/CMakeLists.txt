message("Process tests")

set(TEST_NAME ${PROJECT_NAME}_TESTS)

add_executable(${TEST_NAME} MyFirstTest.cpp)

target_link_libraries(${TEST_NAME}
  gtest
  gtest_main
  gmock
)

add_test(NAME ${TEST_NAME} COMMAND ${TEST_NAME})