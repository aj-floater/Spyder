# Inverse Kinematics (IK) in Arm Class

The code snippet provided demonstrates the implementation of the `ComputeInverseKinematics()` function in the Arm class. This function calculates the motor angles required to position the arm's end point (`end_point`) based on a desired target position relative to the arm's start point (`start_point`). The inverse kinematics calculation allows the arm to reach a specific target position by determining the appropriate angles for each motor.

Let's break down the code and explain its functionality:

1. **Computing Differences in Positions**: The function starts by computing the differences in x, y, and z coordinates between the end point and the start point of the arm. These differences represent the desired displacement of the arm.

2. **Motor 1 Angle Calculation**: The `motor1_angle` is calculated using the `atan2` function. It determines the angle required to align the arm's end point with the target position in the x-z plane.

3. **Motor 2 and Motor 3 Angle Calculation**: The function proceeds to calculate the angles (`q1` and `q2`) for the second and third motors. These angles are determined based on the desired displacement in x, y, and z coordinates and the lengths of the limb segments (`limb1_length`, `limb2_length`, and `limb3_length`). The equations used involve trigonometric functions such as `acosf`, `atan2f`, `sinf`, and `cosf`.

4. **Handling Special Cases**: There are two cases to consider when calculating the motor angles. First, if the value of `motor2_angle` is NaN (not a number), it indicates an invalid angle. In this case, the `motor2_angle` is recalculated using the `atan2f` function, and a flag (`PropertyManager::invalid`) is set to indicate an invalid state. Similarly, if the value of `motor3_angle` is NaN, it is recalculated and the flag is set.

5. **Invalid State Handling**: If the motor angles are valid (not NaN), the `PropertyManager::invalid` flag is set to false, indicating a valid state.

The `ComputeInverseKinematics()` function plays a crucial role in determining the motor angles required for the arm to reach a specific target position. By using inverse kinematics calculations, the arm can adapt its configuration to achieve precise positioning based on the desired end point coordinates.

It's important to note that the provided code snippet lacks the definition and initialization of variables such as `end_point`, `start_point`, `limb1_length`, `limb2_length`, and `limb3_length`. Additionally, the code assumes the availability of trigonometric functions (`atan2`, `acosf`, `atan2f`, `sinf`, `cosf`) provided by the standard math library.

Here's a screenshot of a couple of the notes I made when I made this thing:
<img width="1022" alt="Screenshot 2023-05-28 at 01 31 03" src="https://github.com/aj-floater/Spyder/assets/80073564/d5e5ec1b-e034-4815-8f0c-4f1555eb2a27">
