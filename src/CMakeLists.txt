add_subdirectory(configured)
add_subdirectory(app)

if(${ENABLE_PLATFORM_BUILD})
    add_subdirectory(bsp/Stm32G4)
endif(${ENABLE_PLATFORM_BUILD})