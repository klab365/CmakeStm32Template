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
    -Wno-unused-parameter
    "$<$<COMPILE_LANGUAGE:CXX>:-Wconversion;-Wno-volatile;-Wold-style-cast;-Wuseless-cast;-Wsuggest-override>"
    "$<$<CONFIG:Debug>:-Og -g3 -ggdb>"
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