# STM32 Minimal CMake project for C/C++ projects
cmake_minimum_required(VERSION 3.15)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# Set Project version with -DPROJECT_VERSION=x.x.x otherwhise the version would be 0.0.0
if (NOT DEFINED PROJECT_VERSION)
  set(PROJECT_VERSION 0.0.0)
endif()

project("Stm32G4-Template" VERSION ${PROJECT_VERSION} LANGUAGES C ASM CXX)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
message(STATUS "Version: ${CMAKE_PROJECT_VERSION}")

# Set build type to Debug if not specified
if ("${CMAKE_BUILD_TYPE}" STREQUAL "")
    set(CMAKE_BUILD_TYPE Debug)
endif()
message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")

# options
option(ENABLE_TESTS "Build the tests" ON)
option(ENABLE_PLATFORM_BUILD "Build for the target" OFF)

# Includes
include(clang-tools/clang-format)

# Testing
if(ENABLE_TESTS)
    include(googletest/common)
    enable_testing()
    googletest_get_populate()
    add_subdirectory(tests)
endif()

# add source files
add_subdirectory(src)
