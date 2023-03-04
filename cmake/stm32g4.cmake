set(CPU_PARAMETERS
    -mcpu=cortex-m4
    -mthumb
    -mfpu=fpv4-sp-d16
    -mfloat-abi=hard)

add_compile_options(
    ${CPU_PARAMETERS}
)

add_link_options(
    ${CPU_PARAMETERS}
)