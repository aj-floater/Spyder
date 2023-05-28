# Spyder Project

<img width="1258" alt="Screenshot 2023-05-28 at 00 52 37" src="https://github.com/aj-floater/Spyder/assets/80073564/f1ff08ac-d3d2-4462-b9e1-7ce78907db57">

This project is a 3D simulation of a spyder-like robotic hexapod using OpenGL and C++. It allows for interactive control and movement of the whole robot.

## Installation

### Prerequisites
- CMake (version 3.0 or higher)
- OpenGL library (for your specific platform)

### Instructions

1. Clone the project repository:
   ```
   git clone https://github.com/aj-floater/spyder.git
   ```

2. Navigate to the project directory:
   ```
   cd spyder
   ```

3. Create a build directory and stay in the root directory:
   ```
   mkdir build
   ```

4. Generate the build files using CMake:
   ```
   cmake -S . -B ./build
   ```

5. Build the project:
   ```
   cmake --build ./build
   ```

6. Run the executable:
   ```
   ./build/spyder
   ```

Note: Make sure you have the necessary OpenGL library installed and linked correctly for your platform.

## Project Structure

The project is structured as follows:

- `libs/glfw3`: Third-party GLFW library.
- `libs/glm`: Third-party GLM library.
- `src`: Source code directory.
   - `third-party`: Contains third-party dependencies.
   - `third-party/imgui`: ImGui library for GUI.
   - `third-party/imgui/backends`: ImGui backend implementation files.
   - `*.cpp`: Source files for the project.
- `include`: Header files directory.
- `resources`: Resources directory (textures, models, etc.).

There are summaries for the robot simulation itself in the include directory under all *.md files. 

## Usage

Upon running the executable, you will see the 3D simulation window with the spyder robot displayed. Use the following controls to interact with the simulation:

- Mouse movement: Rotate the camera view.
- WASD keys: Move the spyder arm in different directions.
- Spacebar and Shift keys: Move the camera view up and down, respectively.
- Right Click: Toggle between camera movement and mouse movement.

To move the robot at the moment, you `must` use a connected xbox controller (this will change soon).

## Contributing

Contributions to the project are welcome! If you encounter any issues or have suggestions for improvements, please submit a pull request or open an issue on the project repository.
