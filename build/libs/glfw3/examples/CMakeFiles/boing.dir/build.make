# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.23.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.23.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/archiejames/coding/Spyder_copy

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/archiejames/coding/Spyder_copy/build

# Include any dependencies generated for this target.
include libs/glfw3/examples/CMakeFiles/boing.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include libs/glfw3/examples/CMakeFiles/boing.dir/compiler_depend.make

# Include the progress variables for this target.
include libs/glfw3/examples/CMakeFiles/boing.dir/progress.make

# Include the compile flags for this target's objects.
include libs/glfw3/examples/CMakeFiles/boing.dir/flags.make

libs/glfw3/examples/boing.app/Contents/Resources/glfw.icns: ../libs/glfw3/examples/glfw.icns
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Copying OS X content libs/glfw3/examples/boing.app/Contents/Resources/glfw.icns"
	$(CMAKE_COMMAND) -E copy /Users/archiejames/coding/Spyder_copy/libs/glfw3/examples/glfw.icns libs/glfw3/examples/boing.app/Contents/Resources/glfw.icns

libs/glfw3/examples/CMakeFiles/boing.dir/boing.c.o: libs/glfw3/examples/CMakeFiles/boing.dir/flags.make
libs/glfw3/examples/CMakeFiles/boing.dir/boing.c.o: ../libs/glfw3/examples/boing.c
libs/glfw3/examples/CMakeFiles/boing.dir/boing.c.o: libs/glfw3/examples/CMakeFiles/boing.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/archiejames/coding/Spyder_copy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object libs/glfw3/examples/CMakeFiles/boing.dir/boing.c.o"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/glfw3/examples/CMakeFiles/boing.dir/boing.c.o -MF CMakeFiles/boing.dir/boing.c.o.d -o CMakeFiles/boing.dir/boing.c.o -c /Users/archiejames/coding/Spyder_copy/libs/glfw3/examples/boing.c

libs/glfw3/examples/CMakeFiles/boing.dir/boing.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/boing.dir/boing.c.i"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/archiejames/coding/Spyder_copy/libs/glfw3/examples/boing.c > CMakeFiles/boing.dir/boing.c.i

libs/glfw3/examples/CMakeFiles/boing.dir/boing.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/boing.dir/boing.c.s"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/archiejames/coding/Spyder_copy/libs/glfw3/examples/boing.c -o CMakeFiles/boing.dir/boing.c.s

libs/glfw3/examples/CMakeFiles/boing.dir/__/deps/glad_gl.c.o: libs/glfw3/examples/CMakeFiles/boing.dir/flags.make
libs/glfw3/examples/CMakeFiles/boing.dir/__/deps/glad_gl.c.o: ../libs/glfw3/deps/glad_gl.c
libs/glfw3/examples/CMakeFiles/boing.dir/__/deps/glad_gl.c.o: libs/glfw3/examples/CMakeFiles/boing.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/archiejames/coding/Spyder_copy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object libs/glfw3/examples/CMakeFiles/boing.dir/__/deps/glad_gl.c.o"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/glfw3/examples/CMakeFiles/boing.dir/__/deps/glad_gl.c.o -MF CMakeFiles/boing.dir/__/deps/glad_gl.c.o.d -o CMakeFiles/boing.dir/__/deps/glad_gl.c.o -c /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/glad_gl.c

libs/glfw3/examples/CMakeFiles/boing.dir/__/deps/glad_gl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/boing.dir/__/deps/glad_gl.c.i"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/glad_gl.c > CMakeFiles/boing.dir/__/deps/glad_gl.c.i

libs/glfw3/examples/CMakeFiles/boing.dir/__/deps/glad_gl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/boing.dir/__/deps/glad_gl.c.s"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/glad_gl.c -o CMakeFiles/boing.dir/__/deps/glad_gl.c.s

# Object files for target boing
boing_OBJECTS = \
"CMakeFiles/boing.dir/boing.c.o" \
"CMakeFiles/boing.dir/__/deps/glad_gl.c.o"

# External object files for target boing
boing_EXTERNAL_OBJECTS =

libs/glfw3/examples/boing.app/Contents/MacOS/boing: libs/glfw3/examples/CMakeFiles/boing.dir/boing.c.o
libs/glfw3/examples/boing.app/Contents/MacOS/boing: libs/glfw3/examples/CMakeFiles/boing.dir/__/deps/glad_gl.c.o
libs/glfw3/examples/boing.app/Contents/MacOS/boing: libs/glfw3/examples/CMakeFiles/boing.dir/build.make
libs/glfw3/examples/boing.app/Contents/MacOS/boing: libs/glfw3/src/libglfw3.a
libs/glfw3/examples/boing.app/Contents/MacOS/boing: libs/glfw3/examples/CMakeFiles/boing.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/archiejames/coding/Spyder_copy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable boing.app/Contents/MacOS/boing"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/boing.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libs/glfw3/examples/CMakeFiles/boing.dir/build: libs/glfw3/examples/boing.app/Contents/MacOS/boing
libs/glfw3/examples/CMakeFiles/boing.dir/build: libs/glfw3/examples/boing.app/Contents/Resources/glfw.icns
.PHONY : libs/glfw3/examples/CMakeFiles/boing.dir/build

libs/glfw3/examples/CMakeFiles/boing.dir/clean:
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples && $(CMAKE_COMMAND) -P CMakeFiles/boing.dir/cmake_clean.cmake
.PHONY : libs/glfw3/examples/CMakeFiles/boing.dir/clean

libs/glfw3/examples/CMakeFiles/boing.dir/depend:
	cd /Users/archiejames/coding/Spyder_copy/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/archiejames/coding/Spyder_copy /Users/archiejames/coding/Spyder_copy/libs/glfw3/examples /Users/archiejames/coding/Spyder_copy/build /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples/CMakeFiles/boing.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libs/glfw3/examples/CMakeFiles/boing.dir/depend

