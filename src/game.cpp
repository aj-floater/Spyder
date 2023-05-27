#include "game.h"

// Variables    ------------------------------------------------------------------------------------

Key Game::ESCAPE, Game::F, Game::MOUSE_2, Game::T;

Controller Game::controller;

GLFWwindow* Game::window;
GLFWmonitor* Game::monitor;
const GLFWvidmode* Game::mode;
float Game::time, Game::previous_time; 
int Game::fps;

Camera Game::camera(glm::vec3(-1.25f, 6.0f, 0.0f));
unsigned int Game::SCR_WIDTH, Game::SCR_HEIGHT;
int Game::SCR_POS_X, Game::SCR_POS_Y;
float Game::lastX, Game::lastY, Game::SCR_RATIO;
bool Game::firstMouse = true;
bool Game::is_fullscreen = false;

Plane Game::plane;
Body Game::body;
Arm arm;

// Initializers ------------------------------------------------------------------------------------

void Game::Init(){
    InitGLFW();
    CreateGLFWWindow();
    InitGLAD();
    OpenGLSetup();

    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO &io = ImGui::GetIO();
    // Setup Platform/Renderer bindings
    // ImGui_ImplGlfw_InitForOpenGL(Game::window, true);
    // ImGui_ImplOpenGL3_Init("#version 150");
    // Setup Dear ImGui style
    ImGui::StyleColorsDark();

    ESCAPE.create(GLFW_KEY_ESCAPE);
    F.create(GLFW_KEY_F);
    T.create(GLFW_KEY_T);
    MOUSE_2.create(GLFW_MOUSE_BUTTON_2);

    plane.Init();
    body.Init(Position(0, 0, 0), 1.5, 1.5);
    // arm.Init(Position(0.0f,0.0f,0.0f), Position(2.0f,0.0f,0.0f), 0.75f, 1.0f, 1.25f);
}

// glfw: initialize glfw
void Game::InitGLFW(){
    glfwInit();
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

#ifdef __APPLE__
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
#endif
}

// glfw: whenever the window size changed (by OS or user resize) this callback function executes
void framebuffer_size_callback(GLFWwindow* window, int width, int height){
    // make sure the viewport matches the new window dimensions; note that width and 
    // height will be significantly larger than specified on retina displays.
    glViewport((width - height/Game::SCR_RATIO)/2, 0, height / Game::SCR_RATIO, height);
}

// glfw: whenever the mouse state is changed this callback function executes
void mouse_callback(GLFWwindow* window, double xpos, double ypos)
{
    if (Game::firstMouse)
    {
        Game::lastX = xpos;
        Game::lastY = ypos;
        Game::firstMouse = false;
    }

    float xoffset = xpos - Game::lastX;
    float yoffset = Game::lastY - ypos; // reversed since y-coordinates go from bottom to top

    Game::lastX = xpos;
    Game::lastY = ypos;
    if (Game::camera.windowFocused){
        Game::camera.ProcessMouseMovement(xoffset, yoffset);
    }
}

// glfw: create window
void Game::CreateGLFWWindow(){
    monitor = glfwGetPrimaryMonitor();
    mode = glfwGetVideoMode(monitor);
    SCR_WIDTH = mode->width;
    SCR_HEIGHT = mode->height;
    SCR_RATIO = float(mode->height) / float(mode->width);
    lastX = Game::SCR_WIDTH / 2.0f;
    lastY = Game::SCR_HEIGHT / 2.0f;
    window = glfwCreateWindow(SCR_WIDTH, SCR_HEIGHT, "", NULL, NULL);
    if (window == NULL)
    {
        std::cout << "Failed to create GLFW window" << std::endl;
        glfwTerminate();
    }
    glfwMakeContextCurrent(window);
    glfwSetCursorPosCallback(window, mouse_callback);
    glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);

    glfwSetInputMode(window, GLFW_CURSOR, GLFW_CURSOR_DISABLED);
}

// glad: initialize glad
void Game::InitGLAD(){
    if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
    {
        std::cout << "Failed to initialize GLAD" << std::endl;
    }
    glfwSetWindowMonitor(window, NULL, 100, 100, mode->width/2, mode->height/2, GLFW_DONT_CARE);
    framebuffer_size_callback(window, mode->width/2, mode->height/2);
}

// opengl: setup
void Game::OpenGLSetup(){
    glEnable(GL_BLEND);
    glEnable(GL_CULL_FACE);
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_MULTISAMPLE);

    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
}

float Degrees(const float radians){
    return radians * (180/M_PI);
}

void Game::RenderLoop(){
    OutputFPS();

    PropertyManager::GuiStartup();

    float currentFrame = glfwGetTime();
    PropertyManager::delta_time = currentFrame - previous_time;
    previous_time = currentFrame;

    ProcessKeyInput();
    
    controller.ProcessInput();
    controller.SendInputToBody(&body);

    glClearColor(0.1f, 0.1f, 0.1f, 1);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    // camera/view & projection transformation
    glm::mat4 view = camera.GetViewMatrix();
    glm::mat4 projection = glm::perspective(glm::radians(camera.Zoom), (float)SCR_WIDTH / (float)SCR_HEIGHT, 0.1f, 100.0f);
    glm::mat4 model = glm::mat4(1.0f);

    for (int i = 0; i < 6; i++){
        body.arms[i].Draw(view, projection, camera.Position);
    }
    // body.x_rotation = glm::radians(45.0f);
    body.Update();
    body.Draw(view, projection, camera.Position);

    arm.Draw(view, projection, camera.Position);

    // ------------
    // Draw Plane
    plane.shader.use();
    plane.shader.setMat4("view", view);
    plane.shader.setMat4("projection", projection);
    model = glm::mat4(1.0f);
    model = glm::rotate(model, body.world_angle, glm::vec3(0, 1, 0));
    model = glm::translate(model, glm::vec3(body.world_position.x, 0, body.world_position.z));
    model = glm::scale(model, glm::vec3(100));
    plane.shader.setMat4("model", model);
    plane.shader.setVec3("CameraPos", Game::camera.Position);

    plane.Draw();

    ImGui::Begin("Debugging");
    ImGui::DragFloat("x_rotation", &body.x_rotation, 0.01);
    ImGui::DragFloat("z_rotation", &body.z_rotation, 0.01);
    ImGui::Separator();
    float body_position[3] = {body.position.x, body.position.y, body.position.z};
    ImGui::DragFloat3("body_position", body_position, 0.01);
    body.position.x = body_position[0];
    body.position.y = body_position[1];
    body.position.z = body_position[2];
    ImGui::DragFloat("speed", &body.time, 0.01);
    ImGui::Separator();
    if(ImGui::RadioButton("walking", body.walking)) {
        body.walking = !body.walking;
    }
    if(ImGui::RadioButton("turning", body.turning)) {
        body.turning = !body.turning;
    }
    bool resting;
    if(ImGui::RadioButton("resting", resting)) {
        body.resting = true;
    }
    bool reset_body;
    if(ImGui::RadioButton("reset", reset_body)){
        body.Init(Position(0, 0, 0), 1.5, 1.5);
    }
    ImGui::Separator();
    ImGui::End();

    ImGui::Begin("Arm IK Test");
    ImGui::Text( std::string("Motor 1: " + std::to_string(Degrees(arm.motor1_angle))).c_str() );
    ImGui::Text( std::string("Motor 2: " + std::to_string(Degrees(arm.motor2_angle))).c_str() );
    ImGui::Text( std::string("Motor 3: " + std::to_string(Degrees(arm.motor3_angle))).c_str() );
    float end_point_pos[3] = {arm.end_point.x, arm.end_point.y, arm.end_point.z};
    ImGui::DragFloat3("end point", end_point_pos, 0.01);
    arm.end_point.x = end_point_pos[0];
    arm.end_point.y = end_point_pos[1];
    arm.end_point.z = end_point_pos[2];
    ImGui::End();

    PropertyManager::GuiEnd();

    glfwSwapBuffers(window);
    glfwPollEvents();
}

// Window Settings  ----------------------------------------------------------------------------

void Game::ProcessKeyInput(){
    if (ESCAPE.keyPressRelease(window)){
        glfwSetWindowShouldClose(window, true);
    }
    if (F.keyPressRelease(window)){
        is_fullscreen = !is_fullscreen;
        if (is_fullscreen){
            firstMouse = true;
            GLFWmonitor *monitor = glfwGetPrimaryMonitor();
            const GLFWvidmode* mode = glfwGetVideoMode(monitor);
            glfwGetWindowPos(window, &SCR_POS_X, &SCR_POS_Y);
            glfwSetWindowMonitor(window, monitor, 0, 0, mode->width, mode->height, GLFW_DONT_CARE);
            framebuffer_size_callback(window, mode->width, mode->height);
        }
        else{
            firstMouse = true;
            glfwSetWindowMonitor(window, NULL, SCR_POS_X, SCR_POS_Y, SCR_WIDTH/2, SCR_HEIGHT/2, GLFW_DONT_CARE);
            framebuffer_size_callback(window, SCR_WIDTH/2, SCR_HEIGHT/2);
        }
    }
    if (MOUSE_2.mousePressRelease(window)){
        if (camera.windowFocused){
            glfwSetInputMode(window, GLFW_CURSOR, GLFW_CURSOR_NORMAL);
            camera.windowFocused = false;
        }
        else {
            glfwSetInputMode(window, GLFW_CURSOR, GLFW_CURSOR_DISABLED);
            camera.windowFocused = true;
            firstMouse = true;
        }
    }
    if (camera.windowFocused){
        if (glfwGetKey(window, GLFW_KEY_W) == GLFW_PRESS)
            camera.ProcessKeyboard(FORWARD, PropertyManager::delta_time);
        if (glfwGetKey(window, GLFW_KEY_S) == GLFW_PRESS)
            camera.ProcessKeyboard(BACKWARD, PropertyManager::delta_time);
        if (glfwGetKey(window, GLFW_KEY_A) == GLFW_PRESS)
            camera.ProcessKeyboard(LEFT, PropertyManager::delta_time);
        if (glfwGetKey(window, GLFW_KEY_D) == GLFW_PRESS)
            camera.ProcessKeyboard(RIGHT, PropertyManager::delta_time);
        if (glfwGetKey(window, GLFW_KEY_SPACE) == GLFW_PRESS)
            camera.ProcessKeyboard(UP, PropertyManager::delta_time);
        if (glfwGetKey(window, GLFW_KEY_LEFT_SHIFT) == GLFW_PRESS)
            camera.ProcessKeyboard(DOWN, PropertyManager::delta_time);
    }
}

// FPS  ----------------------------------------------------------------------------------------

void Game::OutputFPS(){
    if (time <= 1){
        time += PropertyManager::delta_time;
        fps += 1;
    }
    else {
        std::string title = "FPS: " + std::to_string(fps);
        glfwSetWindowTitle(window, title.c_str());
        time = 0;
        fps = 0;
    }
}

// Engine Functions   ----------------------------------------------------------------------------
