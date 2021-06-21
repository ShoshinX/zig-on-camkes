# Find the compiler
find_program(
    CMAKE_ZIG_COMPILER
        NAMES "zig"
        HINTS "${CMAKE_SOURCE_DIR} usr/bin"
        DOC "ZIG compiler"
)
mark_as_advanced(CMAKE_ZIG_COMPILER)

set(CMAKE_ZIG_SOURCE_FILE_EXTENSIONS zig;ZIG)
set(CMAKE_ZIG_OUTPUT_EXTENSION ".o")
set(CMAKE_ZIG_COMPILER_ENV_VAR "")

# Configure variables set in this file for fast reload later on
configure_file(
    ${CMAKE_CURRENT_LIST_DIR}/CMakeZIGCompiler.cmake.in
    ${CMAKE_PLATFORM_INFO_DIR}/CMakeZIGCompiler.cmake)

