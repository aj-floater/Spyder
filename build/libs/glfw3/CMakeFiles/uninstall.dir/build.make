# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.18

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\CMake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\CMake\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "C:\Users\arjam\Gits\Spyder 2"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "C:\Users\arjam\Gits\Spyder 2\build"

# Utility rule file for uninstall.

# Include the progress variables for this target.
include libs/glfw3/CMakeFiles/uninstall.dir/progress.make

libs/glfw3/CMakeFiles/uninstall:
	cd /d C:\Users\arjam\Gits\SPYDER~1\build\libs\glfw3 && "C:\Program Files\CMake\bin\cmake.exe" -P "C:/Users/arjam/Gits/Spyder 2/build/libs/glfw3/cmake_uninstall.cmake"

uninstall: libs/glfw3/CMakeFiles/uninstall
uninstall: libs/glfw3/CMakeFiles/uninstall.dir/build.make

.PHONY : uninstall

# Rule to build all files generated by this target.
libs/glfw3/CMakeFiles/uninstall.dir/build: uninstall

.PHONY : libs/glfw3/CMakeFiles/uninstall.dir/build

libs/glfw3/CMakeFiles/uninstall.dir/clean:
	cd /d C:\Users\arjam\Gits\SPYDER~1\build\libs\glfw3 && $(CMAKE_COMMAND) -P CMakeFiles\uninstall.dir\cmake_clean.cmake
.PHONY : libs/glfw3/CMakeFiles/uninstall.dir/clean

libs/glfw3/CMakeFiles/uninstall.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" "C:\Users\arjam\Gits\Spyder 2" "C:\Users\arjam\Gits\Spyder 2\libs\glfw3" "C:\Users\arjam\Gits\Spyder 2\build" "C:\Users\arjam\Gits\Spyder 2\build\libs\glfw3" "C:\Users\arjam\Gits\Spyder 2\build\libs\glfw3\CMakeFiles\uninstall.dir\DependInfo.cmake" --color=$(COLOR)
.PHONY : libs/glfw3/CMakeFiles/uninstall.dir/depend

