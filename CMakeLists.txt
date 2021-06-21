#
# Copyright 2018, Data61, CSIRO (ABN 41 687 119 230)
#
# SPDX-License-Identifier: BSD-2-Clause
#

cmake_minimum_required(VERSION 3.7.2)

project(zig-build-lib C)


list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/apps/zig-build-lib/CMake")
enable_language(ZIG)


add_custom_target(main_custom
    BYPRODUCTS
    "${PROJECT_BINARY_DIR}/${CMAKE_PROJECT_NAME}.a"
    COMMAND ${CMAKE_ZIG_COMPILER} build-lib -target x86_64-freestanding -femit-bin="${PROJECT_BINARY_DIR}/${CMAKE_PROJECT_NAME}.a" "${PROJECT_SOURCE_DIR}/apps/zig-build-lib/components/main/src/run.zig" "-I$<JOIN:$<TARGET_PROPERTY:muslc,INTERFACE_INCLUDE_DIRECTORIES>, -I>"
    )

add_library(main STATIC IMPORTED GLOBAL)
set_property(
    TARGET main
    PROPERTY IMPORTED_LOCATION "${PROJECT_BINARY_DIR}/${CMAKE_PROJECT_NAME}.a"
)
add_dependencies(main main_custom)
DeclareCAmkESComponent(main LIBS main)
DeclareCAmkESRootserver(zig-build-lib.camkes)


add_simulate_test([=[wait_for "Hello, world!!"]=])




