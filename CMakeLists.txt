cmake_minimum_required(VERSION 3.10)

# Set the project name
project(PhysicsEngine)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add compiler flags
if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror -O2 -g -fanalyzer") 
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=address -fstack-protector-strong")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wswitch-default -march=native -flto -fPIE -pie")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D_FORTIFY_SOURCE=2 -fsanitize=undefined -fsanitize=leak")
endif()

# Add the physics engine library
add_library(physics_engine 
    src/physics_engine/physics_engine.cpp
)

# Add the rendering library
add_library(rendering
    src/rendering/glad.c
)

# Define the executable name variable
set(EXECUTABLE_NAME ${EXECUTABLE_NAME} CACHE STRING "Name of the executable")

# Add the main executable
add_executable(${EXECUTABLE_NAME} src/main.cpp 
)

# Link the libraries to the main executable
target_link_libraries(${EXECUTABLE_NAME} physics_engine rendering dl glfw)

# Include directories for the physics engine and rendering
target_include_directories(physics_engine PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include/physics_engine)
target_include_directories(rendering PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include/rendering)
target_include_directories(${EXECUTABLE_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

# Enable pre-compiled headers
target_precompile_headers(${EXECUTABLE_NAME} PRIVATE include/pch.h)