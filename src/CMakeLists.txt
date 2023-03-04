add_subdirectory(app)

if(${ENABLE_PLATFORM_BUILD})
    add_executable(${CMAKE_PROJECT_NAME}) # exe for mcu
    add_subdirectory(bsp/Stm32G4)
    add_subdirectory(configured)
    target_link_libraries(${CMAKE_PROJECT_NAME} "application")

    target_link_options(${CMAKE_PROJECT_NAME} 
        PRIVATE
        -Wl,-Map=${CMAKE_PROJECT_NAME}.map
        -Wl,--print-memory-usage
    )   

    add_custom_command(TARGET ${CMAKE_PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_SIZE} $<TARGET_FILE:${CMAKE_PROJECT_NAME}>
        COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:${CMAKE_PROJECT_NAME}> ${CMAKE_PROJECT_NAME}.hex
        COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:${CMAKE_PROJECT_NAME}> ${CMAKE_PROJECT_NAME}.bin
    )

    option(DUMP_ASM "Create full assembly of final executable" OFF)
    if (${DUMP_ASM})
        add_custom_command(TARGET ${CMAKE_PROJECT_NAME} POST_BUILD
            COMMAND ${CMAKE_OBJDUMP} -D -C $<TARGET_FILE:${CMAKE_PROJECT_NAME}> > ${CMAKE_PROJECT_NAME}.s
        )
    endif()
endif(${ENABLE_PLATFORM_BUILD})