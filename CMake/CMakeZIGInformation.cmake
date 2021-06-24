# This file sets the basic flags for the ZIG Compiler
if(NOT CMAKE_ZIG_COMPILE_OBJECT)
    # -femit-bin here so that zig outputs to the directory that cmake opens to check for object files
    #set(CMAKE_ZIG_COMPILE_OBJECT "<CMAKE_ZIG_COMPILER> build-obj -femit-bin=${PROJECT_BINARY_DIR}/CMakeFiles/${PROJECT_NAME}.dir/${PROJECT_NAME}.zig.o <SOURCE>")
    set(CMAKE_ZIG_COMPILE_OBJECT "<CMAKE_ZIG_COMPILER> build-lib -femit-bin=${OBJECT} <SOURCE>")
#
endif()
if(NOT CMAKE_ZIG_LINK_EXECUTABLE)
    set(CMAKE_ZIG_LINK_EXECUTABLE "<CMAKE_ZIG_COMPILER> build-exe --name ${PROJECT_NAME} <OBJECTS>")
endif()
set(CMAKE_ZIG_INFORMATION_LOADED 1)
