#include <glad/glad.h>
#include <GLFW/glfw3.h>

#include "game.h"

int main(int, char**) {
    Game::Init();
    while (!glfwWindowShouldClose(Game::window)){
        Game::RenderLoop();
    }
}