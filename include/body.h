#pragma once

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>

#include "property_manager.h"
#include "arm.h"

class Body{
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
    Position position, world_position;
    float world_angle;

    float x_rotation, z_rotation;
    float width, length;
    Arm arms[6];

    Cube body;

    Position walk;
    float turn, time = 1;
    bool walking, walk_to_turn, turning, resting;
    bool turn_callibrated;
    int section_number = 0;

    float angle;
    
    Body(){}
    
    void Init(Position position, float width, float length){
        this->position.x = position.x;
        this->position.y = position.y;
        this->position.z = position.z;

        this->width = width;
        this->length = length;

        for (int i = 0; i < 6; i++) arms[i].Init(Position(0, 0, 0), Position(0, 0, 0), 0.5, 1, 1.5);
        // Arm set 1
        SetArmEndPoints(&arms[0], Position(position.x - width/2 - 1, 0, position.z + length/2 +1));
        SetArmEndPoints(&arms[1], Position(position.x - width/2 - 1, 0, position.z + -length/2-1));
        SetArmEndPoints(&arms[2], Position(position.x + width/2 + 2 , 0, position.z             ));
        // Arm se 2
        SetArmEndPoints(&arms[3], Position(position.x - width/2 - 2 , 0, position.z             ));
        SetArmEndPoints(&arms[4], Position(position.x + width/2 + 1, 0, position.z + -length/2-1));
        SetArmEndPoints(&arms[5], Position(position.x + width/2 + 1, 0, position.z + length/2 +1));

        body.Init( Material(glm::vec3(0.27, 0.73, 0.64), glm::vec3(0.27, 0.73, 0.64)), glm::vec3(0), glm::vec3(1));

        for (int i = 0; i < 6; i++) {
            arms[i].rest_angle = atan2(arms[i].end_point.z - position.z, arms[i].end_point.x - position.x);
            arms[i].radius = sqrt(pow(arms[i].end_point.z - position.z, 2) + pow(arms[i].end_point.x - position.x, 2));
        }

        section_number = 0;

        // for (int i = 0; i < 6; i++) arms[i].MoveEndPositionTo(Position(arms[i].end_point.x, arms[i].end_point.y, arms[i].end_point.z+1));
    }

    float ApplyRotations(Arm *arm){
        arm->start_point.x = cosf(x_rotation) * (arm->start_point.x-position.x) - sinf(x_rotation) * (arm->start_point.y-position.y) + position.x; // apply x_rotation to x value
        arm->start_point.y = sinf(x_rotation) * (arm->start_point.x-position.x) + cosf(x_rotation) * (arm->start_point.y-position.y) + position.y; // apply x_rotation to y value
        arm->start_point.z = cosf(z_rotation) * (arm->start_point.z-position.z) - sinf(z_rotation) * (arm->start_point.y-position.y) + position.z; // apply z_rotation to x value
        arm->start_point.y = sinf(z_rotation) * (arm->start_point.z-position.z) + cosf(z_rotation) * (arm->start_point.y-position.y) + position.y; // apply z_rotation to y value
    }

    void SetArmStartPoint(Arm *arm, Position start_point){
        arm->start_point.x = start_point.x;
        arm->start_point.y = start_point.y;
        arm->start_point.z = start_point.z;
    }

    void SetArmEndPoints(Arm *arm, Position end_point){
        arm->end_point.x = end_point.x;
        arm->end_point.y = end_point.y;
        arm->end_point.z = end_point.z;

        arm->end_rest_point.x = end_point.x;
        arm->end_rest_point.y = end_point.y;
        arm->end_rest_point.z = end_point.z;
    }

    void SetArmRestPoint(Arm *arm, Position end_rest_point){
        arm->end_rest_point.x = end_rest_point.x;
        arm->end_rest_point.y = end_rest_point.y;
        arm->end_rest_point.z = end_rest_point.z;
    }

    void Update(){
        // Arm set 1
        SetArmStartPoint(&arms[0], Position(position.x + -width/2+0.25, position.y, position.z + length/2 ));
        SetArmStartPoint(&arms[1], Position(position.x + -width/2+0.25, position.y, position.z + -length/2));
        SetArmStartPoint(&arms[2], Position(position.x + width/2,       position.y, position.z            ));
        // Arm set 2
        SetArmStartPoint(&arms[3], Position(position.x + -width/2,      position.y, position.z            ));
        SetArmStartPoint(&arms[4], Position(position.x + width/2-0.25,  position.y, position.z + -length/2));
        SetArmStartPoint(&arms[5], Position(position.x + width/2-0.25,  position.y, position.z + length/2 ));

        // Arm set 1
        SetArmRestPoint(&arms[0], Position(position.x - width/2 - 1, 0, position.z + length/2 +1));
        SetArmRestPoint(&arms[1], Position(position.x - width/2 - 1, 0, position.z + -length/2-1));
        SetArmRestPoint(&arms[2], Position(position.x + width/2 + 2 , 0, position.z             ));
        // Arm se 2
        SetArmRestPoint(&arms[3], Position(position.x - width/2 - 2 , 0, position.z             ));
        SetArmRestPoint(&arms[4], Position(position.x + width/2 + 1, 0, position.z + -length/2-1));
        SetArmRestPoint(&arms[5], Position(position.x + width/2 + 1, 0, position.z + length/2 +1));

        bool all_stopped = true;
        for (int i = 0; i < 6; i++){
            if (arms[i].moving) all_stopped = false;
        }
        if (all_stopped && walking){
            if (section_number == 0){
                for (int i = 0; i < 3; i++){
                    arms[i].MoveEndPositionTo(Position(arms[i].end_rest_point.x + walk.x, arms[i].end_rest_point.y, arms[i].end_rest_point.z + walk.z), time, true);
                }
                for (int i = 3; i < 6; i++){
                    arms[i].MoveEndPositionTo(Position(arms[i].end_rest_point.x - walk.x, arms[i].end_rest_point.y, arms[i].end_rest_point.z - walk.z), time, false);
                }
                section_number = 1;
            }
            else if (section_number == 1){
                for (int i = 3; i < 6; i++){
                    arms[i].MoveEndPositionTo(Position(arms[i].end_rest_point.x + walk.x, arms[i].end_rest_point.y, arms[i].end_rest_point.z + walk.z), time, true);
                }
                for (int i = 0; i < 3; i++){
                    arms[i].MoveEndPositionTo(Position(arms[i].end_rest_point.x - walk.x, arms[i].end_rest_point.y, arms[i].end_rest_point.z - walk.z), time, false);
                }
                section_number = 0;
            }
        }
        if (all_stopped && walk_to_turn){
            if (section_number == 0){
                for (int i = 0; i < 3; i++){
                    arms[i].MoveEndPositionTo(Position(arms[i].radius * cosf(arms[i].rest_angle - turn), arms[i].end_rest_point.y, arms[i].radius * sinf(arms[i].rest_angle - turn)), time, false);
                }
                for (int i = 3; i < 6; i++){
                    arms[i].MoveEndPositionTo(Position(arms[i].radius * cosf(arms[i].rest_angle + turn), arms[i].end_rest_point.y, arms[i].radius * sinf(arms[i].rest_angle + turn)), time, true);
                }
                section_number = 1;
            }
            else if (section_number == 1){
                turn_callibrated = true;
                section_number = 0;
                walk_to_turn = false;
            }
        }
        if (all_stopped && turning){
            if (section_number == 0){
                for (int i = 0; i < 3; i++){
                    arms[i].MoveEndPositionAroundPointAtAngle(&position, arms[i].rest_angle + turn, time, i, true);
                }
                for (int i = 3; i < 6; i++){
                    arms[i].MoveEndPositionAroundPointAtAngle(&position, arms[i].rest_angle - turn, time, i, false);
                }
                section_number = 1;
            }
            else if (section_number == 1){
                for (int i = 3; i < 6; i++){
                    arms[i].MoveEndPositionAroundPointAtAngle(&position, arms[i].rest_angle + turn, time, i, true);
                }
                for (int i = 0; i < 3; i++){
                    arms[i].MoveEndPositionAroundPointAtAngle(&position, arms[i].rest_angle - turn, time, i, false);
                }
                section_number = 0;
            }
        }
        else if (all_stopped && resting){
            bool rested = true;
            for (int i = 0; i < 6; i++){
                if (Distance(arms[i].end_rest_point, arms[i].end_point) > 0) rested = false;
            }
            if (!rested){
                if (section_number == 0){
                    for (int i = 0; i < 3; i++){
                        arms[i].MoveEndPositionTo(Position(arms[i].end_rest_point.x, arms[i].end_rest_point.y, arms[i].end_rest_point.z), 0.5, true);
                    }
                    section_number = 1;
                }
                else if (section_number == 1){
                    for (int i = 3; i < 6; i++){
                        arms[i].MoveEndPositionTo(Position(arms[i].end_rest_point.x, arms[i].end_rest_point.y, arms[i].end_rest_point.z), 0.5, true);
                    }
                    section_number = 0;
                }
            }
            if (rested){
                resting = false;
                section_number = 0;
            }
        }

        for (int i = 0; i < 6; i++){
            ApplyRotations(&arms[i]);
            arms[i].Update();
        }
    }

    void Draw(glm::mat4 view, glm::mat4 projection, glm::vec3 camera_position){
        DrawCube(body, view, projection, camera_position);
        glm::mat4 model = glm::mat4(1.0f);
        model = glm::translate(model, glm::vec3(position.x, position.y, position.z));
        model = glm::rotate(model, x_rotation, glm::vec3(0, 0, 1)); 
        model = glm::rotate(model, z_rotation, glm::vec3(-1, 0, 0));
        model = glm::scale(model, glm::vec3(width*0.75, 0.75, length));
        body.shader.setMat4("model", model);
        body.Draw();
    }
};