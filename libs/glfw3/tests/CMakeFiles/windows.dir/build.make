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
CMAKE_BINARY_DIR = /Users/archiejames/coding/Spyder_copy

# Include any dependencies generated for this target.
include libs/glfw3/tests/CMakeFiles/windows.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include libs/glfw3/tests/CMakeFiles/windows.dir/compiler_depend.make

# Include the progress variables for this target.
include libs/glfw3/tests/CMakeFiles/windows.dir/progress.make

# Include the compile flags for this target's objects.
include libs/glfw3/tests/CMakeFiles/windows.dir/flags.make

libs/glfw3/tests/CMakeFiles/windows.dir/windows.c.o: libs/glfw3/tests/CMakeFiles/windows.dir/flags.make
libs/glfw3/tests/CMakeFiles/windows.dir/windows.c.o: libs/glfw3/tests/windows.c
libs/glfw3/tests/CMakeFiles/windows.dir/windows.c.o: libs/glfw3/tests/CMakeFiles/windows.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/archiejames/coding/Spyder_copy/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object libs/glfw3/tests/CMakeFiles/windows.dir/windows.c.o"
	cd /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/glfw3/tests/CMakeFiles/windows.dir/windows.c.o -MF CMakeFiles/windows.dir/windows.c.o.d -o CMakeFiles/windows.dir/windows.c.o -c /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests/windows.c

libs/glfw3/tests/CMakeFiles/windows.dir/windows.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/windows.dir/windows.c.i"
	cd /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests/windows.c > CMakeFiles/windows.dir/windows.c.i

libs/glfw3/tests/CMakeFiles/windows.dir/windows.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/windows.dir/windows.c.s"
	cd /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests/windows.c -o CMakeFiles/windows.dir/windows.c.s

libs/glfw3/tests/CMakeFiles/windows.dir/__/deps/getopt.c.o: libs/glfw3/tests/CMakeFiles/windows.dir/flags.make
libs/glfw3/tests/CMakeFiles/windows.dir/__/deps/getopt.c.o: libs/glfw3/deps/getopt.c
libs/glfw3/tests/CMakeFiles/windows.dir/__/deps/getopt.c.o: libs/glfw3/tests/CMakeFiles/windows.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/archiejames/coding/Spyder_copy/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object libs/glfw3/tests/CMakeFiles/windows.dir/__/deps/getopt.c.o"
	cd /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/glfw3/tests/CMakeFiles/windows.dir/__/deps/getopt.c.o -MF CMakeFiles/windows.dir/__/deps/getopt.c.o.d -o CMakeFiles/windows.dir/__/deps/getopt.c.o -c /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/getopt.c

libs/glfw3/tests/CMakeFiles/windows.dir/__/deps/getopt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/windows.dir/__/deps/getopt.c.i"
	cd /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/getopt.c > CMakeFiles/windows.dir/__/deps/getopt.c.i

libs/glfw3/tests/CMakeFiles/windows.dir/__/deps/getopt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/windows.dir/__/deps/getopt.c.s"
	cd /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/getopt.c -o CMakeFiles/windows.dir/__/deps/getopt.c.s

libs/glfw3/tests/CMakeFiles/windows.dir/__/deps/glad_gl.c.o: libs/glfw3/tests/CMakeFiles/windows.dir/flags.make
libs/glfw3/tests/CMakeFiles/windows.dir/__/deps/glad_gl.c.o: libs/glfw3/deps/glad_gl.c
libs/glfw3/tests/CMakeFiles/windows.dir/__/deps/glad_gl.c.o: libs/glfw3/tests/CMakeFiles/windows.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/archiejames/coding/Spyder_copy/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object libs/glfw3/tests/CMakeFiles/windows.dir/__/deps/glad_gl.c.o"
	cd /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/glfw3/tests/CMakeFiles/windows.dir/__/deps/glad_gl.c.o -MF CMakeFiles/windows.dir/__/deps/glad_gl.c.o.d -o CMakeFiles/windows.dir/__/deps/glad_gl.c.o -c /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/glad_gl.c

libs/glfw3/tests/CMakeFiles/windows.dir/__/deps/glad_gl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/windows.dir/__/deps/glad_gl.c.i"
	cd /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/glad_gl.c > CMakeFiles/windows.dir/__/deps/glad_gl.c.i

libs/glfw3/tests/CMakeFiles/windows.dir/__/deps/glad_gl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/windows.dir/__/deps/glad_gl.c.s"
	cd /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/glad_gl.c -o CMakeFiles/windows.dir/__/deps/glad_gl.c.s

# Object files for target windows
windows_OBJECTS = \
"CMakeFiles/windows.dir/windows.c.o" \
"CMakeFiles/windows.dir/__/deps/getopt.c.o" \
"CMakeFiles/windows.dir/__/deps/glad_gl.c.o"

# External object files for target windows
windows_EXTERNAL_OBJECTS =

libs/glfw3/tests/windows.app/Contents/MacOS/windows: libs/glfw3/tests/CMakeFiles/windows.dir/windows.c.o
libs/glfw3/tests/windows.app/Contents/MacOS/windows: libs/glfw3/tests/CMakeFiles/windows.dir/__/deps/getopt.c.o
libs/glfw3/tests/windows.app/Contents/MacOS/windows: libs/glfw3/tests/CMakeFiles/windows.dir/__/deps/glad_gl.c.o
libs/glfw3/tests/windows.app/Contents/MacOS/windows: libs/glfw3/tests/CMakeFiles/windows.dir/build.make
libs/glfw3/tests/windows.app/Contents/MacOS/windows: libs/glfw3/src/libglfw3.a
libs/glfw3/tests/windows.app/Contents/MacOS/windows: libs/glfw3/tests/CMakeFiles/windows.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/archiejames/coding/Spyder_copy/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable windows.app/Contents/MacOS/windows"
	cd /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/windows.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libs/glfw3/tests/CMakeFiles/windows.dir/build: libs/glfw3/tests/windows.app/Contents/MacOS/windows
.PHONY : libs/glfw3/tests/CMakeFiles/windows.dir/build

libs/glfw3/tests/CMakeFiles/windows.dir/clean:
	cd /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests && $(CMAKE_COMMAND) -P CMakeFiles/windows.dir/cmake_clean.cmake
.PHONY : libs/glfw3/tests/CMakeFiles/windows.dir/clean

libs/glfw3/tests/CMakeFiles/windows.dir/depend:
	cd /Users/archiejames/coding/Spyder_copy && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/archiejames/coding/Spyder_copy /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests /Users/archiejames/coding/Spyder_copy /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests/CMakeFiles/windows.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libs/glfw3/tests/CMakeFiles/windows.dir/depend

