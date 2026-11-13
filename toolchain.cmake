set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)

# Crucial: Tell CMake to only build a static library during try_compile
# This stops CMake from trying to link a full executable without syscall stubs
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)