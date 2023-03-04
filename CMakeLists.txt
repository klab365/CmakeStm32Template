# STM32 Minimal CMake project for C/C++ projects
cmake_minimum_required(VERSION 3.15)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# Set Project version with -DPROJECT_VERSION=x.x.x otherwhise the version would be 0.0.0
if (NOT DEFINED PROJECT_VERSION)
  set(PROJECT_VERSION 0.0.0)
endif()

# options
option(ENABLE_TESTS "Build the tests" ON)
option(ENABLE_PLATFORM_BUILD "Build for the target" OFF)

project("Stm32G4-Template" VERSION ${PROJECT_VERSION} LANGUAGES C ASM CXX)
message("Version: ${CMAKE_PROJECT_VERSION}")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Set debug mode as default
if ("${CMAKE_BUILD_TYPE}" STREQUAL "")
    set(CMAKE_BUILD_TYPE Debug)
endif()
message("Build type: ${CMAKE_BUILD_TYPE}")

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
set(CMAKE_CXX_EXTENSIONS ON)

add_subdirectory(src)

# Testing
if(ENABLE_TESTS)
    include(googletest/common)
    enable_testing()
    googletest_get_populate()
    add_subdirectory(tests)
endif()
