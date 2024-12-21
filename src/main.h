#ifndef MAIN_H
#define MAIN_H

// OpenGL includes
#include <glad/glad.h>
#include <GLFW/glfw3.h>

// Project includes
#include "../include/pch.h"
#include "../include/physics_engine/physics_engine.h"
/**#include "../include/rendering" */

// Global variables and definitions
const char* app_title = "Physics Engine";
const int windowWidth = 800;
const int windowHeight = 600;

// Function prototypes
/**
 * @brief When resizing the window, the viewport should be adjusted as well.
 * 
 * @param window The window to resize.
 * @param width The new width of the window.
 * @param height The new height of the window.
 */
void framebuffer_size_callback(GLFWwindow* window, int width, int height);

/**
 * @brief Processes the input for the current window.
 * 
 * @param window The current window.
 */
void processInput(GLFWwindow* window);

#endif