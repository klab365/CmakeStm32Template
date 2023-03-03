message("Processing STM32 Files")

## variables
set(STM32_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})

## Settings
set(MCU_FAMILY STM32G4xx)
set(MCU_MODEL STM32G474xx)
set(CPU_PARAMETERS
    -mcpu=cortex-m4
    -mthumb
    -mfpu=fpv4-sp-d16
    -mfloat-abi=hard)


## Files
set(STARTUP_SCRIPT ${STM32_ROOT_DIR}/startup_stm32g474xx.s)
set(MCU_LINKER_SCRIPT ${STM32_ROOT_DIR}/STM32G474RETx_FLASH.ld)

set(STM32CUBEMX_INCLUDE_DIRECTORIES
    ${STM32_ROOT_DIR}/Core/Inc
    ${STM32_ROOT_DIR}/Drivers/${MCU_FAMILY}_HAL_Driver/Inc
    ${STM32_ROOT_DIR}/Drivers/${MCU_FAMILY}_HAL_Driver/Inc/Legacy
    ${STM32_ROOT_DIR}/Drivers/CMSIS/Device/ST/${MCU_FAMILY}/Include
    ${STM32_ROOT_DIR}/Drivers/CMSIS/Include
    ${STM32_ROOT_DIR}/ImplementedInterfaces
)

file(GLOB_RECURSE STM32CUBEMX_SOURCES CONFIGURE_DEPENDS
    ${STM32_ROOT_DIR}/Core/*.c
    ${STM32_ROOT_DIR}/Drivers/*.c
)

target_sources(${CMAKE_PROJECT_NAME}
    PRIVATE
    ${STM32CUBEMX_SOURCES}
    ${STARTUP_SCRIPT}
)

target_compile_definitions(${CMAKE_PROJECT_NAME} 
    PRIVATE
    ${MCU_MODEL}
    USE_HAL_DRIVER
)

target_include_directories(${CMAKE_PROJECT_NAME}
    SYSTEM 
    PRIVATE
    ${STM32CUBEMX_INCLUDE_DIRECTORIES}
)

target_compile_options(${CMAKE_PROJECT_NAME}
    PRIVATE
    ${CPU_PARAMETERS}
)

target_link_options(${CMAKE_PROJECT_NAME} 
    PRIVATE
    -T${MCU_LINKER_SCRIPT}
    ${CPU_PARAMETERS}
)

target_compile_definitions(
    ${CMAKE_PROJECT_NAME} 
    PRIVATE
    USE_HAL_DRIVER
)