set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
set(CMAKE_CXX_EXTENSIONS ON)

add_compile_definitions(
    $<$<CONFIG:Debug>:DEBUG>
)

add_compile_options(
    -Wall
    -Wextra
    -Wpedantic
    -Wshadow
    -Wdouble-promotion
    -Wformat=2 -Wformat-truncation
    -Wundef
    -fno-common
    -Wunused-parameter
    "$<$<COMPILE_LANGUAGE:CXX>:-Wconversion;-Wno-volatile;-Wold-style-cast;-Wuseless-cast;-Wsuggest-override>"
    "$<$<CONFIG:Debug>:-Og>"
    "$<$<CONFIG:Release>:-Ofast>"
    "$<$<CONFIG:RelWithDebInfo>:-Ofast -g>"
    "$<$<CONFIG:MinSizeRel>:-Os>"
)

add_link_options(
    -Wl,--start-group
    -lc
    -lm
    -lstdc++
    -Wl,--end-group
)
