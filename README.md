# Physics Engine

## Overview
This is a simple physics engine that uses OpenGL for rendering.

## Prerequisites
- CMake 3.10 or higher
- OpenGL
- GLFW
- Doxygen (optional, for generating documentation)

## Setup
1. **Clone the repository**:
   ```bash
   git clone https://github.com/EmilMotroen/physics-engine.git
   cd physics-engine
   ```
2. **Create a build directory and run CMake**
   ```bash
   mkdir build
   cd build
   cmake ..
   make
   ```
3. **Run the executable**
   ```bash
   ./main_executable
   ```

## Documentation
To generate documentation using Doxygen:
1. **Install Doxygen**
   ```bash
   sudo apt-get install doxygen
   ```
2. **Generate the documentation**
   ```bash
   doxygen Doxyfile
   ```

## License
[MIT](https://choosealicense.com/licenses/mit/)

## Acknowledgements
- [GLFW](https://www.glfw.org/)
- [Glad](https://glad.dav1d.de/)
- [Doxygen](https://www.doxygen.nl/)
- [Learn OpenGL](https://learnopengl.com/)
