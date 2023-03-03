message("Process tests")

cmake_minimum_required(VERSION 3.15)
set(BINARY_NAME Stm32G3_HostTests)
project(${BINARY_NAME} C ASM CXX)
enable_testing()

include(FetchContent)

FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG        release-1.11.0
)
FetchContent_MakeAvailable(googletest)
add_library(GTest::GTest INTERFACE IMPORTED)
target_link_libraries(GTest::GTest INTERFACE gtest_main)

add_executable(${BINARY_NAME} MyFirstTest.cpp)

add_subdirectory(../src/app app)

target_link_libraries(${BINARY_NAME}
  PRIVATE
  GTest::GTest  
)

add_test(${BINARY_NAME} ${BINARY_NAME})

