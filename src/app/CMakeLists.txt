message(STATUS "Process application files")

set(APP_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(LIB_NAME "application")

set(APP_INCLUDE_DIRECTORIES
    ${APP_ROOT_DIR}
)

file(GLOB_RECURSE APP_SOURCES CONFIGURE_DEPENDS
    ${APP_ROOT_DIR}/*.cpp
    ${APP_ROOT_DIR}/*.c
)

add_library(${LIB_NAME} STATIC ${APP_SOURCES})

target_include_directories(${LIB_NAME}
    PUBLIC
    ${APP_INCLUDE_DIRECTORIES}
)