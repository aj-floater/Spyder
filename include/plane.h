#pragma once

#include <glad/glad.h>
#include <glm/glm.hpp>

#include "shader.h"
#include "resource_manager.h"

class Plane{
public:
    unsigned int VAO, VBO, EBO;
    float vertices, indices;

    Shader shader;

    Plane(){}
    void Init(){
        shader = Shader("/resources/shaders/camera_vs.glsl", "/resources/shaders/camera_fs.glsl");
        ResourceManager::ImportTexture("/resources/textures/plane.png", true, "plane");

        float plane_vertices[] = {
            // position     // texture
           -1, 0,  1,      0, 500,
           -1, 0, -1,      0, 0,
            1, 0, -1,      500, 0,
            1, 0,  1,      500, 500
        };
        unsigned int plane_indices[] = {
            0, 1, 2,
            0, 2, 3
        };
        glGenVertexArrays(1, &VAO);
        glGenBuffers(1, &VBO);
        glGenBuffers(1, &EBO);

        glBindVertexArray(VAO);

        glBindBuffer(GL_ARRAY_BUFFER, VBO);
        glBufferData(GL_ARRAY_BUFFER, sizeof(plane_vertices), plane_vertices, GL_STATIC_DRAW);

        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
        glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(plane_indices), plane_indices, GL_STATIC_DRAW);

        // position attribute
        glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 5 * sizeof(float), (void*)0);
        glEnableVertexAttribArray(0);
        // texture attribute
        glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, 5 * sizeof(float), (void*)(void*)(3 * sizeof(float)));
        glEnableVertexAttribArray(1);

        glBindBuffer(GL_ARRAY_BUFFER, 0);
        glBindVertexArray(0);
    }
    void Draw(){
        glDisable(GL_CULL_FACE);
        glBindTexture(GL_TEXTURE_2D, ResourceManager::ReturnTexture("plane"));
        glBindVertexArray(VAO);
        glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);

        glActiveTexture(GL_TEXTURE0);
        glEnable(GL_CULL_FACE);
    }
};