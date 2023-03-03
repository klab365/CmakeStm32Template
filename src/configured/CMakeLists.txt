configure_file(
    "config.h.in"
    "${CMAKE_BINARY_DIR}/configured_files/include/config.h" ESCAPE_QUOTES
)

target_include_directories(${CMAKE_PROJECT_NAME}
    PRIVATE
    "${CMAKE_BINARY_DIR}/configured_files/include"
)