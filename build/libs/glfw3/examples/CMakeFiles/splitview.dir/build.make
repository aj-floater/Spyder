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
include libs/glfw3/examples/CMakeFiles/splitview.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include libs/glfw3/examples/CMakeFiles/splitview.dir/compiler_depend.make

# Include the progress variables for this target.
include libs/glfw3/examples/CMakeFiles/splitview.dir/progress.make

# Include the compile flags for this target's objects.
include libs/glfw3/examples/CMakeFiles/splitview.dir/flags.make

libs/glfw3/examples/splitview.app/Contents/Resources/glfw.icns: ../libs/glfw3/examples/glfw.icns
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Copying OS X content libs/glfw3/examples/splitview.app/Contents/Resources/glfw.icns"
	$(CMAKE_COMMAND) -E copy /Users/archiejames/coding/Spyder_copy/libs/glfw3/examples/glfw.icns libs/glfw3/examples/splitview.app/Contents/Resources/glfw.icns

libs/glfw3/examples/CMakeFiles/splitview.dir/splitview.c.o: libs/glfw3/examples/CMakeFiles/splitview.dir/flags.make
libs/glfw3/examples/CMakeFiles/splitview.dir/splitview.c.o: ../libs/glfw3/examples/splitview.c
libs/glfw3/examples/CMakeFiles/splitview.dir/splitview.c.o: libs/glfw3/examples/CMakeFiles/splitview.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/archiejames/coding/Spyder_copy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object libs/glfw3/examples/CMakeFiles/splitview.dir/splitview.c.o"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/glfw3/examples/CMakeFiles/splitview.dir/splitview.c.o -MF CMakeFiles/splitview.dir/splitview.c.o.d -o CMakeFiles/splitview.dir/splitview.c.o -c /Users/archiejames/coding/Spyder_copy/libs/glfw3/examples/splitview.c

libs/glfw3/examples/CMakeFiles/splitview.dir/splitview.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/splitview.dir/splitview.c.i"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/archiejames/coding/Spyder_copy/libs/glfw3/examples/splitview.c > CMakeFiles/splitview.dir/splitview.c.i

libs/glfw3/examples/CMakeFiles/splitview.dir/splitview.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/splitview.dir/splitview.c.s"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/archiejames/coding/Spyder_copy/libs/glfw3/examples/splitview.c -o CMakeFiles/splitview.dir/splitview.c.s

libs/glfw3/examples/CMakeFiles/splitview.dir/__/deps/glad_gl.c.o: libs/glfw3/examples/CMakeFiles/splitview.dir/flags.make
libs/glfw3/examples/CMakeFiles/splitview.dir/__/deps/glad_gl.c.o: ../libs/glfw3/deps/glad_gl.c
libs/glfw3/examples/CMakeFiles/splitview.dir/__/deps/glad_gl.c.o: libs/glfw3/examples/CMakeFiles/splitview.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/archiejames/coding/Spyder_copy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object libs/glfw3/examples/CMakeFiles/splitview.dir/__/deps/glad_gl.c.o"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/glfw3/examples/CMakeFiles/splitview.dir/__/deps/glad_gl.c.o -MF CMakeFiles/splitview.dir/__/deps/glad_gl.c.o.d -o CMakeFiles/splitview.dir/__/deps/glad_gl.c.o -c /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/glad_gl.c

libs/glfw3/examples/CMakeFiles/splitview.dir/__/deps/glad_gl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/splitview.dir/__/deps/glad_gl.c.i"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/glad_gl.c > CMakeFiles/splitview.dir/__/deps/glad_gl.c.i

libs/glfw3/examples/CMakeFiles/splitview.dir/__/deps/glad_gl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/splitview.dir/__/deps/glad_gl.c.s"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/glad_gl.c -o CMakeFiles/splitview.dir/__/deps/glad_gl.c.s

# Object files for target splitview
splitview_OBJECTS = \
"CMakeFiles/splitview.dir/splitview.c.o" \
"CMakeFiles/splitview.dir/__/deps/glad_gl.c.o"

# External object files for target splitview
splitview_EXTERNAL_OBJECTS =

libs/glfw3/examples/splitview.app/Contents/MacOS/splitview: libs/glfw3/examples/CMakeFiles/splitview.dir/splitview.c.o
libs/glfw3/examples/splitview.app/Contents/MacOS/splitview: libs/glfw3/examples/CMakeFiles/splitview.dir/__/deps/glad_gl.c.o
libs/glfw3/examples/splitview.app/Contents/MacOS/splitview: libs/glfw3/examples/CMakeFiles/splitview.dir/build.make
libs/glfw3/examples/splitview.app/Contents/MacOS/splitview: libs/glfw3/src/libglfw3.a
libs/glfw3/examples/splitview.app/Contents/MacOS/splitview: libs/glfw3/examples/CMakeFiles/splitview.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/archiejames/coding/Spyder_copy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable splitview.app/Contents/MacOS/splitview"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/splitview.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libs/glfw3/examples/CMakeFiles/splitview.dir/build: libs/glfw3/examples/splitview.app/Contents/MacOS/splitview
libs/glfw3/examples/CMakeFiles/splitview.dir/build: libs/glfw3/examples/splitview.app/Contents/Resources/glfw.icns
.PHONY : libs/glfw3/examples/CMakeFiles/splitview.dir/build

libs/glfw3/examples/CMakeFiles/splitview.dir/clean:
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples && $(CMAKE_COMMAND) -P CMakeFiles/splitview.dir/cmake_clean.cmake
.PHONY : libs/glfw3/examples/CMakeFiles/splitview.dir/clean

libs/glfw3/examples/CMakeFiles/splitview.dir/depend:
	cd /Users/archiejames/coding/Spyder_copy/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/archiejames/coding/Spyder_copy /Users/archiejames/coding/Spyder_copy/libs/glfw3/examples /Users/archiejames/coding/Spyder_copy/build /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/examples/CMakeFiles/splitview.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libs/glfw3/examples/CMakeFiles/splitview.dir/depend

