#include "position.h"

float Length(Position A){
    return sqrt(A.x * A.x + A.y * A.y + A.z * A.z);
}

float Distance(Position A, Position B){
    return Length(A-B);
}

float DistanceNoY(Position A, Position B){
    return sqrt(pow(A.x - B.x, 2) + pow(A.z - B.z, 2));
}

Position Normalize(Position A){
    return Position(A.x/Length(A), A.y/Length(A), A.z/Length(A));
}