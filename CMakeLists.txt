#
# Copyright 2018, Data61, CSIRO (ABN 41 687 119 230)
#
# SPDX-License-Identifier: BSD-2-Clause
#

cmake_minimum_required(VERSION 3.7.2)

project(zig-on-camkes C)


list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/apps/zig-on-camkes/CMake")
enable_language(ZIG)



# Source of solution: https://cmake.org/pipermail/cmake/2019-August/069850.html
# Seems to be an old and common problem
list(APPEND dirs_include "-I$<JOIN:$<TARGET_PROPERTY:main_object.instance.bin,INCLUDE_DIRECTORIES>,$<SEMICOLON>-I>")

#file(READ "${PROJECT_BINARY_DIR}/IncludeDirectories.txt" inc_dirs)

add_custom_target(main_custom
    BYPRODUCTS
    "${PROJECT_BINARY_DIR}/${CMAKE_PROJECT_NAME}.a"
    COMMAND ${CMAKE_ZIG_COMPILER} build-lib ${dirs_include} -target x86_64-freestanding -femit-bin=${PROJECT_BINARY_DIR}/${CMAKE_PROJECT_NAME}.a "${PROJECT_SOURCE_DIR}/apps/zig-on-camkes/components/main/src/run.zig" 
    COMMAND_EXPAND_LISTS
    )


add_library(main STATIC IMPORTED GLOBAL)
set_property(
    TARGET main
    PROPERTY IMPORTED_LOCATION "${PROJECT_BINARY_DIR}/${CMAKE_PROJECT_NAME}.a"
)
add_dependencies(main main_custom)
DeclareCAmkESComponent(main LIBS main)
DeclareCAmkESRootserver(zig-on-camkes.camkes)


add_simulate_test([=[wait_for "Hello, world!!"]=])




