#!/bin/bash

# Exit if a command exits with a non-zero status
set -e

# Check if required tools are installed
command -v cmake >/dev/null 2>&1 || 
    { echo >&2 "CMake is required but it's not installed, aborting."; exit 1;}
command -v make >/dev/null 2>&1 || 
    { echo >&2 "Make is required but it's not installed, aborting."; exit 1;}

if [[ "$1" == "--help"  || "$1" == "-h" ]]; then
    echo "Usage: $0 [build_type] [VERBOSE=1] [executable_name]"
    echo "build_type: Debug (default) or Release"
    echo "VERBOSE=1: Enable verbose output to build/verbose_output.log"
    echo "executable_name: Name of the executable to run (default: main_executable)"
    exit 0
fi

BUILD_TYPE=${1:-Debug} # Default to Debug if no argument is provided
VERBOSE=${2:-}
EXECUTABLE=${3:-main_executable}

# Clean build directory
rm -rf build
mkdir -p build

# Run CMake and Make
cmake -S . -B build -DCMAKE_BUILD_TYPE="$BUILD_TYPE" -DEXECUTABLE_NAME="$EXECUTABLE" 
if [ "$VERBOSE" == "VERBOSE=1" ]; then
    cmake --build build --verbose > build/verbose_output.log 2>&1
else
    cmake --build build
fi

# Run the executable
./build/"$EXECUTABLE"
