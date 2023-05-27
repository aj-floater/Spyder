#pragma once

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>

#include "property_manager.h"
#include "cube.h"
#include "position.h"

enum MovementType {
    STRAIGHT,
    CIRCULAR
};

class Arm {
    // External OpenGL Drawing
    //  ------------------------------------------------------------
    void DrawCube(Cube cube, glm::mat4 view, glm::mat4 projection, glm::vec3 camera_position){
        cube.shader.use();
        cube.shader.setMat4("view", view);
        cube.shader.setMat4("projection", projection);
        cube.shader.setVec3("CameraPos", camera_position);
        cube.shader.setVec3("directional_light.direction", glm::vec3(PropertyManager::directional_light[0], PropertyManager::directional_light[1], PropertyManager::directional_light[2]));
        cube.shader.setVec3("directional_light.ambient", 0.5, 0.5, 0.5);
        cube.shader.setVec3("directional_light.diffuse", 0.7, 0.6, 0.6);
    }
public:
    Position start_point;
    Position end_point;
    Position end_rest_point;

    float limb1_length, limb2_length, limb3_length;
    float motor1_angle, motor2_angle, motor3_angle;

    int ID;

    char MovementType;

    // Variables for STRAIGHT Animations
    float distance, speed, y_offset_angle;
    bool moving, apply_ground_offset, middle;
    Position direction, start, end;
    // Variables for CIRCULAR Animations
    float start_angle, end_angle, rest_angle, radius, direction_angle;

    // External OpenGL Drawing Variables
    //  --------------------------------------------------------
    Cube motor1, motor2, motor3;
    Cube limb1, limb2, limb3;
    //  --------------------------------------------------------

    Cube end_point_cube;

    Arm(){};
    Arm(Position start_point, Position end_point, float limb1_length, float limb2_length, float limb3_length){
        Init(start_point, end_point, limb1_length, limb2_length, limb3_length);
    }

    void Init(Position start_point_input, Position end_point_input, float limb1_length, float limb2_length, float limb3_length){
        this->start_point.x = start_point_input.x;
        this->start_point.y = start_point_input.y;
        this->start_point.z = start_point_input.z;
        
        this->end_point.x = end_point_input.x;
        this->end_point.y = end_point_input.y;
        this->end_point.z = end_point_input.z;

        this->limb1_length = limb1_length;
        this->limb2_length = limb2_length;
        this->limb3_length = limb3_length;

        // External OpenGL Drawing
        //  ------------------------------------------------------------------------
        motor1.Init(Material(glm::vec3(0.84, 0.64, 0.5 ), glm::vec3(0.84, 0.64, 0.5 )), glm::vec3(0), glm::vec3(0.5));
        motor2.Init(Material(glm::vec3(0.93, 0.29, 0.41), glm::vec3(0.93, 0.29, 0.41)), glm::vec3(0), glm::vec3(0.4));
        motor3.Init(Material(glm::vec3(0.1, 0.48, 0.74 ), glm::vec3(0.1, 0.48, 0.74 )), glm::vec3(0), glm::vec3(0.3));

        limb1.Init( Material(glm::vec3(0.93, 0.51, 0.33), glm::vec3(0.93, 0.51, 0.33)), glm::vec3(0), glm::vec3(1));
        limb2.Init( Material(glm::vec3(0.87, 0.23, 0.34), glm::vec3(0.87, 0.23, 0.34)), glm::vec3(0), glm::vec3(1));
        limb3.Init( Material(glm::vec3(0.07, 0.37, 0.54), glm::vec3(0.07, 0.37, 0.54)), glm::vec3(0), glm::vec3(1));

        end_point_cube.Init(   Material(glm::vec3(0.12, 0.29, 0.34), glm::vec3(0.12, 0.29, 0.34)), glm::vec3(0), glm::vec3(0.3));
    }

    void ComputeInverseKinematics(){
        float x = end_point.x - start_point.x;
        float y = end_point.y - start_point.y;
        float z = end_point.z - start_point.z;
        motor1_angle = atan2(z, x);

        x = (end_point.z/sinf(motor1_angle)) - ((start_point.z/sinf(motor1_angle)) + limb1_length);
        if (end_point.z == start_point.z)
            x = (end_point.x/cosf(motor1_angle)) - ((start_point.x/cosf(motor1_angle)) + limb1_length);

        float q2 = M_PI - acosf((powf(limb2_length, 2) + powf(limb3_length, 2) - powf(x, 2) - powf(y, 2))/(2*limb2_length*limb3_length));
        float q1 = atan2f(y,x) + atan2f((limb3_length*sinf(q2)),(limb2_length+limb3_length*cosf(q2))) - q2;

        motor2_angle = q1 + q2;
        motor3_angle = q1;

        if (motor2_angle != motor2_angle) {
            motor2_angle = atan2f(y, x);
            PropertyManager::invalid = true;
        }
        if (motor3_angle != motor3_angle) {
            motor3_angle = atan2f(y, x);
            PropertyManager::invalid = true;
        }
        else PropertyManager::invalid = false;
    }

    void MoveEndPositionTo(Position new_position, float time, bool apply_ground_offset){
        start = end_point;
        end = new_position;
        distance = DistanceNoY(start, end);
        this->speed = distance / time;
        // if (distance < 0.2) this->speed = distance / (time * 2);
        direction = Normalize(end - start);
        moving = true;
        this->apply_ground_offset = apply_ground_offset;
        // this->apply_ground_offset = false;
        y_offset_angle = 0;
        MovementType = STRAIGHT;
    }


    void ApplySTRAIGHTMovement(){
        end_point.x += direction.x * speed * PropertyManager::delta_time;
        end_point.y += direction.y * speed * PropertyManager::delta_time;
        end_point.z += direction.z * speed * PropertyManager::delta_time;

        float distance_from_target = sqrt(pow(end_point.x-start.x,2) + pow(end_point.z-start.z,2));

        if (apply_ground_offset){
            float time = distance/speed;
            float height = 0.5;
            float y = height * sinf(y_offset_angle);
            y_offset_angle += M_PI/time * PropertyManager::delta_time;
            end_point.y = y;
        }

        if (distance_from_target >= distance){
            end_point.x = end.x;
            end_point.y = end.y;
            end_point.z = end.z;
            moving = false;
        }
    }

    float smallestAngleBetween(float targetA, float sourceA){
        float a = targetA - sourceA;
        if (a > M_PI) a -= M_PI*2;
        if (a < -M_PI) a += M_PI*2;
        return a;
    }

    void MoveEndPositionAroundPointAtAngle(Position *point, float angle, float time, int ID, bool apply_ground_offset){
        float current_angle = atan2(end_point.z - point->z, end_point.x - point->x);
        if (ID == 3 && current_angle < 0){
            current_angle = M_PI*2 + current_angle;
        }
        float smallest_angle = smallestAngleBetween(angle, current_angle);
        start_angle = current_angle;
        end_angle = angle;
        if (smallest_angle < 0){
            direction_angle = -1;
            distance = abs(smallest_angle);
        }
        if (smallest_angle > 0){
            direction_angle = 1;
            distance = abs(smallest_angle);
        }
        this->speed = distance/time;
        this->ID = ID; 
        moving = true;
        this->apply_ground_offset = apply_ground_offset;
        y_offset_angle = 0;
        MovementType = CIRCULAR;
    }

    void ApplyCIRCULARMovement(){
        start_angle += direction_angle * speed * PropertyManager::delta_time;
        end_point.x = radius * cos(start_angle);
        end_point.z = radius * sin(start_angle);

        if (apply_ground_offset){
            float time = abs(distance)/speed;
            float height = 0.5;
            float y = height * sinf(y_offset_angle);
            y_offset_angle += M_PI/time * PropertyManager::delta_time;
            end_point.y = y;
        }
        
        if (direction_angle > 0 && start_angle >= end_angle){
            end_point.x = radius * cos(end_angle);
            end_point.z = radius * sin(end_angle);
            moving = false;
        }
        else if (direction_angle < 0 && start_angle <= end_angle){
            end_point.x = radius * cos(end_angle);
            end_point.z = radius * sin(end_angle);
            moving = false;
        }
    }

    void Update(){
        ComputeInverseKinematics();

        if (moving){
            if (MovementType == STRAIGHT)
                ApplySTRAIGHTMovement();
            else if (MovementType == CIRCULAR){
                ApplyCIRCULARMovement();
            }
        }
    }
    
    // External OpenGL Drawing
    //  ----------------------------------------------------------------------------------------
    void ComputeForwardKinematics(){
        motor1.position.x = start_point.x;
        motor1.position.y = start_point.y;
        motor1.position.z = start_point.z;

        motor2.position.x = motor1.position.x + cosf(motor1_angle) * limb1_length;
        motor2.position.y = motor1.position.y;
        motor2.position.z = motor1.position.z + sinf(motor1_angle) * limb1_length;

        motor3.position.x = motor2.position.x + cosf(motor1_angle) * (limb2_length * cosf(motor2_angle)); // x coordinate for point 2
        motor3.position.y = motor2.position.y +                      (limb2_length * sinf(motor2_angle)); // y coordinate for point 2
        motor3.position.z = motor2.position.z + sinf(motor1_angle) * (limb2_length * cosf(motor2_angle)); // z coordinate for point 2
    }

    void Draw(glm::mat4 view, glm::mat4 projection, glm::vec3 camera_position){
        ComputeInverseKinematics();
        ComputeForwardKinematics();

        glm::mat4 model = glm::mat4(1.0f);

        // Draw motor 1
        DrawCube(motor1, view, projection, camera_position);
        model = glm::mat4(1.0f);
        model = glm::translate(model, motor1.position);
        model = glm::scale(model, motor1.scale);
        motor1.shader.setMat4("model", model);
        motor1.Draw();

        // Draw motor 2
        DrawCube(motor2, view, projection, camera_position);
        model = glm::mat4(1.0f);
        model = glm::translate(model, motor2.position);
        model = glm::rotate(model, -motor1_angle, glm::vec3(0, 1, 0)); // apply motor 1 angle
        model = glm::rotate(model, motor2_angle, glm::vec3(0, 0, 1)); // apply motor 2 angle
        model = glm::scale(model, motor2.scale);
        motor2.shader.setMat4("model", model);
        motor2.Draw();

        // Draw motor 3
        DrawCube(motor3, view, projection, camera_position);
        model = glm::mat4(1.0f);
        model = glm::translate(model, motor3.position);
        model = glm::rotate(model, motor1_angle, glm::vec3(0, -1, 0));  // apply motor 1 angle
        model = glm::rotate(model, motor3_angle, glm::vec3(0, 0, 1));   // apply motor 3 angle
        model = glm::scale(model, motor3.scale);
        motor3.shader.setMat4("model", model);
        motor3.Draw();

        // Draw End of Arm
        DrawCube(end_point_cube, view, projection, camera_position);
        model = glm::mat4(1.0f);
        end_point_cube.position = glm::vec3(end_point.x, end_point.y, end_point.z);
        model = glm::translate(model, end_point_cube.position);
        model = glm::rotate(model, motor1_angle, glm::vec3(0, -1, 0));  // apply motor 1 angle
        model = glm::scale(model, end_point_cube.scale);
        end_point_cube.shader.setMat4("model", model);
        end_point_cube.Draw();

        // ------------
        // Draw Limbs
        DrawCube(limb1, view, projection, camera_position);
        model = glm::mat4(1.0f);
        float x = motor1.position.x + (motor2.position.x - motor1.position.x)/2;
        float y = motor1.position.y + (motor2.position.y - motor1.position.y)/2;
        float z = motor1.position.z + (motor2.position.z - motor1.position.z)/2;
        model = glm::translate(model, glm::vec3(x, y, z));
        model = glm::rotate(model, motor1_angle, glm::vec3(0, -1, 0));  // apply motor 1 angle
        model = glm::scale(model, glm::vec3(limb1_length, 0.3, 0.3));
        limb1.shader.setMat4("model", model);
        limb1.Draw();

        DrawCube(limb2, view, projection, camera_position);
        model = glm::mat4(1.0f);
        x = motor2.position.x + (motor3.position.x - motor2.position.x)/2;
        y = motor2.position.y + (motor3.position.y - motor2.position.y)/2;
        z = motor2.position.z + (motor3.position.z - motor2.position.z)/2;
        model = glm::translate(model, glm::vec3(x, y, z));
        model = glm::rotate(model, motor1_angle, glm::vec3(0, -1, 0));  // apply motor 1 angle
        model = glm::rotate(model, motor2_angle, glm::vec3(0, 0, 1));
        model = glm::scale(model, glm::vec3(limb2_length, 0.25, 0.25));
        limb2.shader.setMat4("model", model);
        limb2.Draw();
        
        DrawCube(limb3, view, projection, camera_position);
        model = glm::mat4(1.0f);
        x = motor3.position.x + (end_point_cube.position.x - motor3.position.x)/2;
        y = motor3.position.y + (end_point_cube.position.y - motor3.position.y)/2;
        z = motor3.position.z + (end_point_cube.position.z - motor3.position.z)/2;
        model = glm::translate(model, glm::vec3(x, y, z));
        model = glm::rotate(model, motor1_angle, glm::vec3(0, -1, 0));  // apply motor 1 angle
        model = glm::rotate(model, motor3_angle, glm::vec3(0, 0, 1));
        model = glm::scale(model, glm::vec3(limb3_length, 0.2, 0.2));
        limb3.shader.setMat4("model", model);
        limb3.Draw();
    }
};