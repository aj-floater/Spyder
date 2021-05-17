cmake_minimum_required(VERSION 3.0.0)
set (CMAKE_CXX_STANDARD 11)
project(spyder)

# adds subdirectories for third party libraries
add_subdirectory(${CMAKE_SOURCE_DIR}/libs/glfw3)
add_subdirectory(${CMAKE_SOURCE_DIR}/libs/glm)

# adds include directory
include_directories(${CMAKE_SOURCE_DIR}/include)

set(LIBS glfw glm)

if(APPLE)
    # find opengl
    find_library(OpenGL_LIBRARY OpenGL)
    set(LIBS ${LIBS} ${OpenGL_LIBRARY})
elseif(WIN32)
    set(LIBS ${LIBS} opengl32 -lshlwapi)
endif(APPLE)

# adds static libraries
add_library(GLAD ${CMAKE_SOURCE_DIR}/src/third-party/glad.c)
add_library(STB_IMAGE ${CMAKE_SOURCE_DIR}/src/third-party/stb_image.cpp)
set(LIBS ${LIBS} GLAD STB_IMAGE)

# adds source files to SOURCE
file(GLOB SOURCE
    "src/*.cpp"
    "src/third-party/imgui/*.cpp"
)

# copy resources directory into build folder
file(GLOB RESOURCES ${CMAKE_SOURCE_DIR}/resources)
file(COPY ${RESOURCES} DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

add_executable(${PROJECT_NAME} ${SOURCE})

target_link_libraries(${PROJECT_NAME} PUBLIC ${LIBS})