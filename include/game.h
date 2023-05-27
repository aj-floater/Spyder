#pragma once

#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <glm/glm.hpp>
#include <imgui/backends/imgui_impl_glfw.h>
#include <imgui/backends/imgui_impl_opengl3.h>

#include <iostream>

#include "keys.h"
#include "camera.h"
#include "resource_manager.h"
#include "plane.h"
#include "property_manager.h"
#include "shader.h"
#include "arm.h"
#include "body.h"
#include "controller.h"

#include "cube.h"

class Game {
    // Initializers --------------------------------
    static void InitGLFW();
    static void CreateGLFWWindow();
    static void InitGLAD();
    static void OpenGLSetup();

    // Window Settings  ----------------------------
    static bool is_fullscreen;

    static void ProcessKeyInput();
    static Key ESCAPE, MOUSE_2, F, T;

    // Gamepad Settings ----

    static Controller controller;

    static const float *axes;
    static int axesCount;
    static int gamepad_present;

    // FPS  ----------------------------------------
    static void OutputFPS();
    static float time, previous_time;
    static int fps;

    // Plane    ------------------------------------
    static Plane plane;
    static Body body;

public:
    static GLFWwindow* window;
    static GLFWmonitor *monitor;
    static const GLFWvidmode* mode;

    // Window Settings  ----------------------------
    static float SCR_RATIO;
    static unsigned int SCR_WIDTH, SCR_HEIGHT;
    static int SCR_POS_X, SCR_POS_Y;
    
    // Camera Properties    ------------------------
    static Camera camera;
    static float lastX, lastY;
    static bool firstMouse;

    static void Init();
    static void RenderLoop();
};