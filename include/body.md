# Body.h summary by `gpt-3.5-turbo`

The given code defines a class called `Body`, which represents a 3D body composed of multiple arms and a cube. It appears to be a part of a larger program that involves OpenGL drawing and arm movement.

Let's break down the code and explain its functionality:

1. **Header Files**: The code includes necessary header files, such as `<glm/glm.hpp>` and `<glm/gtc/matrix_transform.hpp>`, which are part of the GLM library for mathematics operations in OpenGL. It also includes `"property_manager.h"` and `"arm.h"` files, which are custom header files containing the definitions of `PropertyManager` and `Arm` classes.

2. **Class Definition**: The `Body` class is defined, which encapsulates the properties and behaviors of a 3D body.

3. **Private Member Function**: The code includes a private member function called `DrawCube`. It takes a `Cube` object, along with view, projection, and camera position parameters, and sets the necessary shader values for drawing the cube in an OpenGL context.

4. **Public Members**: The `Body` class has several public member variables and functions:

   - `Position position, world_position`: These variables represent the position of the body in 3D space. `position` represents the local position relative to its parent, while `world_position` represents the position in the global/world coordinate system.
   
   - `float world_angle`: This variable represents the rotation angle of the body in the global coordinate system.
   
   - `float x_rotation, z_rotation`: These variables represent the rotation angles around the x-axis and z-axis, respectively.
   
   - `float width, length`: These variables represent the dimensions of the body.
   
   - `Arm arms[6]`: An array of six `Arm` objects representing the arms of the body.
   
   - `Cube body`: An instance of the `Cube` class representing the body's cube shape.
   
   - Other variables and flags: There are several boolean variables (`walking`, `walk_to_turn`, `turning`, `resting`, `turn_callibrated`) and integer variables (`section_number`) used as flags or counters to control the body's movement and animation.
   
   - `void Init(Position position, float width, float length)`: This function initializes the body with the given position, width, and length. It sets up the arms' end points, calculates rest angles and arm radii, and initializes the cube shape.
   
   - `void Update()`: This function updates the state of the body. It handles arm movement, walking, turning, and resting based on the current state and flags.
   
   - `void Draw(glm::mat4 view, glm::mat4 projection, glm::vec3 camera_position)`: This function is responsible for drawing the body. It calls the `DrawCube` function to set the necessary shader values, prepares the model matrix for the cube, and then draws the cube using the provided view, projection, and camera position.

Overall, the `Body` class represents a 3D body with arms and cube shape. It provides functionality for initializing, updating, and drawing the body in an OpenGL context. The details of the `Arm` and `Cube` classes, as well as the OpenGL context setup and other parts of the program, are not included in the provided code snippet.

# Update() method summary

The `Update()` function is a method in the body class that appears to control the movement and positioning of a set of arms. Here's a breakdown of the function:

1. **Arm Start and Rest Points:** The function begins by setting the start and rest points for each arm in two different sets (Arm set 1 and Arm set 2). The start points define the initial position of each arm, while the rest points represent the desired resting position.

2. **Checking Movement Status:** The function then checks if any of the arms are currently in motion. If any arm is still moving, the variable `all_stopped` is set to false.

3. **Walking Movement:** If all arms have stopped moving and the body is in a walking state (`walking` flag is true), the function performs a walking movement. The movement is divided into two sections.

   - Section 0: The arms in set 1 move their end positions (`MoveEndPositionTo`) by an offset `walk` in the x and z coordinates. The time parameter determines the duration of the movement. The last argument (`true`) indicates that the arm is moving forward.
   - Section 1: The arms in set 2 move their end positions by the negative offset `walk` in the x and z coordinates. The last argument (`false`) indicates that the arm is moving backward. The section number is updated to 1.

4. **Walk-to-Turn Movement:** If all arms have stopped moving and the body is in a walk-to-turn state (`walk_to_turn` flag is true), the function performs a movement to prepare for a turn. This movement also consists of two sections.

   - Section 0: The arms in set 1 move their end positions in a circular path around a point (`MoveEndPositionAroundPointAtAngle`). The position of the point is given by the `position` variable, and the angle of rotation is determined by the `turn` value. The last argument (`true`) indicates that the arm is moving forward.
   - Section 1: The arms in set 2 move their end positions in a circular path around the same point, but with the opposite angle of rotation. The last argument (`true`) indicates that the arm is moving forward. Once this section is completed, the `turn_callibrated` flag is set to true, and the section number is updated to 0 while setting `walk_to_turn` to false.

5. **Turning Movement:** If all arms have stopped moving and the body is in a turning state (`turning` flag is true), the function performs a turning movement. Similar to previous movements, it consists of two sections.

   - Section 0: The arms in set 1 move their end positions in a circular path around the `position` point at an angle determined by the `turn` value. The last argument (`true`) indicates that the arm is moving forward.
   - Section 1: The arms in set 2 move their end positions in a circular path around the same point, but with the opposite angle of rotation. The last argument (`false`) indicates that the arm is moving backward. Once this section is completed, the section number is updated to 0.

6. **Resting Movement:** If all arms have stopped moving and the body is in a resting state (`resting` flag is true), the function checks if the arms have reached their rest positions. If they haven't, the function performs a movement to align the end positions with the rest positions.

   - Section 0: The arms in set 1 move their end positions towards their rest positions.
   - Section 1: The arms in set 2 move their end positions towards their rest positions.
   - Once the arms have reached their

 rest positions, the `resting` flag is set to false, and the section number is reset to 0.

7. **Applying Rotations and Updating Arms:** Before the function ends, it applies any necessary rotations to each arm (`ApplyRotations`) and calls the `Update()` function for each arm.

Overall, the `Update()` function controls various movements and states of the arms, including walking, turning, and resting, based on different flags and section numbers.