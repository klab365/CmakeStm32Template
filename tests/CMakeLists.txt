message("Process tests")

cmake_minimum_required(VERSION 3.15)
set(BINARY_NAME ${PROJECT_NAME}_TESTS)
project(${BINARY_NAME} C ASM CXX)

include(FetchContent)

FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG        release-1.11.0
)
FetchContent_MakeAvailable(googletest)
add_library(GTest::GTest INTERFACE IMPORTED)
target_link_libraries(GTest::GTest INTERFACE gtest_main)

# Link project with what we want to test and the GTest and pthread library
add_executable(${BINARY_NAME} MyFirstTest.cpp)

target_link_libraries(${BINARY_NAME} ${GTEST_LIBRARIES} pthread)

add_test(${BINARY_NAME} ${BINARY_NAME})

