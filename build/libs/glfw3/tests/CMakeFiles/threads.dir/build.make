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
include libs/glfw3/tests/CMakeFiles/threads.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include libs/glfw3/tests/CMakeFiles/threads.dir/compiler_depend.make

# Include the progress variables for this target.
include libs/glfw3/tests/CMakeFiles/threads.dir/progress.make

# Include the compile flags for this target's objects.
include libs/glfw3/tests/CMakeFiles/threads.dir/flags.make

libs/glfw3/tests/CMakeFiles/threads.dir/threads.c.o: libs/glfw3/tests/CMakeFiles/threads.dir/flags.make
libs/glfw3/tests/CMakeFiles/threads.dir/threads.c.o: ../libs/glfw3/tests/threads.c
libs/glfw3/tests/CMakeFiles/threads.dir/threads.c.o: libs/glfw3/tests/CMakeFiles/threads.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/archiejames/coding/Spyder_copy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object libs/glfw3/tests/CMakeFiles/threads.dir/threads.c.o"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/tests && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/glfw3/tests/CMakeFiles/threads.dir/threads.c.o -MF CMakeFiles/threads.dir/threads.c.o.d -o CMakeFiles/threads.dir/threads.c.o -c /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests/threads.c

libs/glfw3/tests/CMakeFiles/threads.dir/threads.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/threads.dir/threads.c.i"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/tests && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests/threads.c > CMakeFiles/threads.dir/threads.c.i

libs/glfw3/tests/CMakeFiles/threads.dir/threads.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/threads.dir/threads.c.s"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/tests && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests/threads.c -o CMakeFiles/threads.dir/threads.c.s

libs/glfw3/tests/CMakeFiles/threads.dir/__/deps/tinycthread.c.o: libs/glfw3/tests/CMakeFiles/threads.dir/flags.make
libs/glfw3/tests/CMakeFiles/threads.dir/__/deps/tinycthread.c.o: ../libs/glfw3/deps/tinycthread.c
libs/glfw3/tests/CMakeFiles/threads.dir/__/deps/tinycthread.c.o: libs/glfw3/tests/CMakeFiles/threads.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/archiejames/coding/Spyder_copy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object libs/glfw3/tests/CMakeFiles/threads.dir/__/deps/tinycthread.c.o"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/tests && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/glfw3/tests/CMakeFiles/threads.dir/__/deps/tinycthread.c.o -MF CMakeFiles/threads.dir/__/deps/tinycthread.c.o.d -o CMakeFiles/threads.dir/__/deps/tinycthread.c.o -c /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/tinycthread.c

libs/glfw3/tests/CMakeFiles/threads.dir/__/deps/tinycthread.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/threads.dir/__/deps/tinycthread.c.i"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/tests && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/tinycthread.c > CMakeFiles/threads.dir/__/deps/tinycthread.c.i

libs/glfw3/tests/CMakeFiles/threads.dir/__/deps/tinycthread.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/threads.dir/__/deps/tinycthread.c.s"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/tests && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/tinycthread.c -o CMakeFiles/threads.dir/__/deps/tinycthread.c.s

libs/glfw3/tests/CMakeFiles/threads.dir/__/deps/glad_gl.c.o: libs/glfw3/tests/CMakeFiles/threads.dir/flags.make
libs/glfw3/tests/CMakeFiles/threads.dir/__/deps/glad_gl.c.o: ../libs/glfw3/deps/glad_gl.c
libs/glfw3/tests/CMakeFiles/threads.dir/__/deps/glad_gl.c.o: libs/glfw3/tests/CMakeFiles/threads.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/archiejames/coding/Spyder_copy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object libs/glfw3/tests/CMakeFiles/threads.dir/__/deps/glad_gl.c.o"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/tests && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/glfw3/tests/CMakeFiles/threads.dir/__/deps/glad_gl.c.o -MF CMakeFiles/threads.dir/__/deps/glad_gl.c.o.d -o CMakeFiles/threads.dir/__/deps/glad_gl.c.o -c /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/glad_gl.c

libs/glfw3/tests/CMakeFiles/threads.dir/__/deps/glad_gl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/threads.dir/__/deps/glad_gl.c.i"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/tests && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/glad_gl.c > CMakeFiles/threads.dir/__/deps/glad_gl.c.i

libs/glfw3/tests/CMakeFiles/threads.dir/__/deps/glad_gl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/threads.dir/__/deps/glad_gl.c.s"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/tests && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/archiejames/coding/Spyder_copy/libs/glfw3/deps/glad_gl.c -o CMakeFiles/threads.dir/__/deps/glad_gl.c.s

# Object files for target threads
threads_OBJECTS = \
"CMakeFiles/threads.dir/threads.c.o" \
"CMakeFiles/threads.dir/__/deps/tinycthread.c.o" \
"CMakeFiles/threads.dir/__/deps/glad_gl.c.o"

# External object files for target threads
threads_EXTERNAL_OBJECTS =

libs/glfw3/tests/threads.app/Contents/MacOS/threads: libs/glfw3/tests/CMakeFiles/threads.dir/threads.c.o
libs/glfw3/tests/threads.app/Contents/MacOS/threads: libs/glfw3/tests/CMakeFiles/threads.dir/__/deps/tinycthread.c.o
libs/glfw3/tests/threads.app/Contents/MacOS/threads: libs/glfw3/tests/CMakeFiles/threads.dir/__/deps/glad_gl.c.o
libs/glfw3/tests/threads.app/Contents/MacOS/threads: libs/glfw3/tests/CMakeFiles/threads.dir/build.make
libs/glfw3/tests/threads.app/Contents/MacOS/threads: libs/glfw3/src/libglfw3.a
libs/glfw3/tests/threads.app/Contents/MacOS/threads: libs/glfw3/tests/CMakeFiles/threads.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/archiejames/coding/Spyder_copy/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable threads.app/Contents/MacOS/threads"
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/threads.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libs/glfw3/tests/CMakeFiles/threads.dir/build: libs/glfw3/tests/threads.app/Contents/MacOS/threads
.PHONY : libs/glfw3/tests/CMakeFiles/threads.dir/build

libs/glfw3/tests/CMakeFiles/threads.dir/clean:
	cd /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/tests && $(CMAKE_COMMAND) -P CMakeFiles/threads.dir/cmake_clean.cmake
.PHONY : libs/glfw3/tests/CMakeFiles/threads.dir/clean

libs/glfw3/tests/CMakeFiles/threads.dir/depend:
	cd /Users/archiejames/coding/Spyder_copy/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/archiejames/coding/Spyder_copy /Users/archiejames/coding/Spyder_copy/libs/glfw3/tests /Users/archiejames/coding/Spyder_copy/build /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/tests /Users/archiejames/coding/Spyder_copy/build/libs/glfw3/tests/CMakeFiles/threads.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libs/glfw3/tests/CMakeFiles/threads.dir/depend

