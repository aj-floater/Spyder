#ifndef POSITION_H
#define POSITION_H

#include "math.h"

class Position{
public:
    float x, y, z;

    Position(){}
    Position(float x, float y, float z){
        this->x = x;
        this->y = y;
        this->z = z;
    }
    Position operator + (const Position &p) {
        return Position(x + p.x, y + p.y, z + p.z);
    }
    Position operator - (const Position &p) {
        return Position(x - p.x, y - p.y, z - p.z);
    }
    bool operator==(const Position &A) {
        bool equal = true;
        if (this->x != A.x) equal = false;
        if (this->y != A.y) equal = false;
        if (this->z != A.z) equal = false;
        return equal;
    }
};

float Length(Position A);
float Distance(Position A, Position B);
float DistanceNoY(Position A, Position B);
Position Normalize(Position A);

#endif