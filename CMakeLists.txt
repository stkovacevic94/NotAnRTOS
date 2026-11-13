cmake_minimum_required(VERSION 3.20)
project(NotAnRTOS C ASM)

set(MCU_FLAGS 
    -mcpu=cortex-m4
    -mthumb
    -mfloat-abi=soft
)

add_executable(notanrtos
    main.c
    startup_stm32f446re.c
)

set_target_properties(notanrtos PROPERTIES SUFFIX ".elf")

target_compile_options(notanrtos PRIVATE
    ${MCU_FLAGS}
    -Wall
    -O0
    -std=gnu11
    -g
)

target_link_options(notanrtos PRIVATE
    ${MCU_FLAGS}
    -T${CMAKE_CURRENT_SOURCE_DIR}/STM32F446RE.ld
    -Wl,-Map=${CMAKE_CURRENT_BINARY_DIR}/notanrtos.map
    -nostdlib
    --specs=nosys.specs  
)