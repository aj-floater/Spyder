#pragma once

#include <GLFW/glfw3.h>

class Key{
private:
    bool keypressed;
    int32_t key;
public:
    Key(){}
    Key(int32_t key_code){
        create(key_code);
    }
    void create(int32_t key_code){
        this->key = key_code;
    }
    bool keyPressRelease(GLFWwindow *window){
        if (glfwGetKey(window, key) == GLFW_PRESS)
            keypressed = true;
        if ((glfwGetKey(window, key) == GLFW_RELEASE && keypressed)){
            keypressed = false;
            return true;
        }
        else return false;
    }
    bool mousePressRelease(GLFWwindow *window){
        if (glfwGetMouseButton(window, key) == GLFW_PRESS)
            keypressed = true;
        if ((glfwGetMouseButton(window, key) == GLFW_RELEASE && keypressed)){
            keypressed = false;
            return true;
        }
        else return false;
    }
};