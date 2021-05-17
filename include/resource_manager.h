#pragma once

#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include "stb_image.h"

#include <map>
#include <string>
#include <iostream>

#include "shader.h"
#include "get_path.h"

class ResourceManager{

    static std::map<std::string, unsigned int> texture_data;
    static std::map<std::string, Shader> shader_data;

public:

    static std::string executable_dir;
    static void ImportTexture(const char *path, bool is_alpha, std::string save_name);
    static void ImportShader(const char *vertex_path, const char *fragment_path, std::string save_name);

    static unsigned int ReturnTexture(std::string name);
    static Shader ReturnShader(std::string name);
    
};