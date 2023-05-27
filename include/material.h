#pragma once

#include <glm/glm.hpp>
#include "shader.h"

class Material{
public:
    glm::vec3 ambient, diffuse;

    Material(){}
    Material(glm::vec3 ambient, glm::vec3 diffuse){
        Init(ambient, diffuse);
    }
    void Init(glm::vec3 ambient, glm::vec3 diffuse){
        this->ambient = ambient;
        this->diffuse = diffuse;
    }

    void PassValuesIntoShader(Shader shader){
        shader.setVec3("material.ambient", ambient);
        shader.setVec3("material.diffuse", diffuse);
    }
};