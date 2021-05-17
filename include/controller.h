#pragma once

#include "position.h"

struct Joystick{
    float x, z, angle, radius;
};

struct Timer {
    float start_time;
    float GetTimer(float current_time){
        return current_time - start_time;
    }
};

class Controller{
    int axesCount;
    const float *axes;
    Timer left_joystick_idle;

    void RecieveAxesData(){
        axes = glfwGetJoystickAxes(GLFW_JOYSTICK_1, &axesCount);
    }
    void StoreAxesData(){
        left_joystick.x = axes[0];
        left_joystick.z = axes[1];
        right_joystick.x = axes[2];
        right_joystick.z = axes[3];
    }
    void CalculateJoystickAngles(){
        left_joystick.angle = atan2(left_joystick.z, left_joystick.x);
        right_joystick.angle = atan2(right_joystick.z, right_joystick.x);
    }
    void CalculateJoystickDistanceFromCenter(){
        left_joystick.radius = sqrt(pow(left_joystick.x,2) + pow(left_joystick.z,2));
        right_joystick.radius = sqrt(pow(right_joystick.x,2) + pow(right_joystick.z,2));
    }
public:
    int gamepad_present;
    Joystick left_joystick, right_joystick;

    Controller(){}
    void ProcessInput(){
        gamepad_present = glfwJoystickPresent(GLFW_JOYSTICK_1);
        if (gamepad_present){
            RecieveAxesData();
            StoreAxesData();
            CalculateJoystickAngles();
            CalculateJoystickDistanceFromCenter();
        }
    }
    void SendInputToBody(Body *body){
        if (left_joystick.radius > 0.2){
            body->walking = true;

            body->speed = left_joystick.radius * 1.5;
            if (body->speed < 0.5) body->speed = 0.5;

            body->walk.x = left_joystick.x/2;
            body->walk.z = left_joystick.z/2;

            left_joystick_idle.start_time = 0;
        }
        else {
            body->walking = false;
            if (left_joystick_idle.start_time == 0){
                left_joystick_idle.start_time = glfwGetTime();
            }
            if (left_joystick_idle.GetTimer(glfwGetTime()) > 1){
                left_joystick_idle.start_time = -1;
                body->resting = true;
            }
            body->walk.x = 0;
            body->walk.z = 0;
        }
    }
};