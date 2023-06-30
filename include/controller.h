#pragma once

#include "position.h"

struct Joystick{
    float x, z, angle, radius;

    float previous_x, previous_z;
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
    Timer joystick_idle;
    bool turn_callibrated, height_change, walk_to_turn;

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
    bool JoystickMovementEratic(Joystick *joystick){
        float distance_travelled = sqrt(pow(joystick->previous_x - joystick->x, 2) + pow(joystick->previous_z - joystick->z, 2));
        joystick->previous_x = joystick->x;
        joystick->previous_z = joystick->z;
        if (distance_travelled > 0.5) return true;
        else return false;
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
        if (left_joystick.radius > 0.2 && !body->turning && !body->resting && !body->walk_to_turn && !JoystickMovementEratic(&left_joystick)){
            body->walking = true;

            body->time = 0.5 - left_joystick.radius * 0.3;
            if (body->time > 0.5) body->time = 0.5;
            std::cout << "Left Joystick Radius: " << left_joystick.radius << std::endl;
            // if (body->time > 0.5) body->time = 0.5;

            body->walk.x = left_joystick.x * 0.6;
            body->walk.z = left_joystick.z * 0.6;
            std::cout << "Left Joystick X: " << left_joystick.x << std::endl;
            std::cout << "Left Joystick Z: " << left_joystick.z << std::endl;

            Position direction = Normalize((body->world_position + body->walk) - body->world_position);

            float x = -direction.x * abs(body->walk.x)/body->time * PropertyManager::delta_time;
            float z = -direction.z * abs(body->walk.z)/body->time * PropertyManager::delta_time;

            float world_radius = sqrt(pow(x, 2) + pow(z, 2));
            float angle = atan2(z, x) + body->world_angle;
            body->world_position.x += cos(angle) * world_radius * 2;
            body->world_position.z += sin(angle) * world_radius * 2;

            joystick_idle.start_time = 0;
            body->turn_callibrated = false;
        }
        else if (abs(right_joystick.x) > 0.2 && !body->walking && !body->resting && !JoystickMovementEratic(&right_joystick)){
            if (!body->turn_callibrated) {
                body->walk_to_turn = true;
                if (!walk_to_turn) {
                    body->section_number = 0;
                    walk_to_turn = true;
                }
            }
            else {
                body->turning = true;
            }

            body->time = 0.5 - right_joystick.radius * 0.3;
            if (body->time > 0.5) body->time = 0.5;
            std::cout << "Right Joystick Radius: " << right_joystick.radius << std::endl;
            // if (body->time > 0.5) body->time = 0.5;

            body->turn = right_joystick.x * 0.3;

            body->world_angle += body->turn * 5 * PropertyManager::delta_time;

            joystick_idle.start_time = 0;
        }
        else {
            body->walking = false;
            body->turning = false;
            
            if (joystick_idle.start_time == 0){
                joystick_idle.start_time = glfwGetTime();
            }
            if (joystick_idle.GetTimer(glfwGetTime()) > 1){
                joystick_idle.start_time = -1;
                body->resting = true;
                body->rested = false;
            }
            body->walk.x = 0;
            body->walk.z = 0;
            body->turn = 0;

            body->turn_callibrated = false;
        }

        // if (abs(right_joystick.z) > 0.75 && !body->turning){
        //     height_change = true;
        //     body->position.y += right_joystick.z * PropertyManager::delta_time;
        //     if (body->position.y > 1.5) body->position.y = 1.5;
        //     if (body->position.y < 0) body->position.y = 0;
        // }
        // else height_change = false;
    }
};