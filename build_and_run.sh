#!/bin/bash

# Exit if a command exits with a non-zero status
set -e

# Check if required tools are installed
command -v cmake >/dev/null 2>&1 || 
    { echo >&2 "CMake is required but it's not installed, aborting."; exit 1;}
command -v make >/dev/null 2>&1 || 
    { echo >&2 "Make is required but it's not installed, aborting."; exit 1;}

if [[ "$1" == "--help"  || "$1" == "-h" ]]; then
    echo "Usage: $0 [build_type] [VERBOSE=1] [executable_name] [compiler]"
    echo "build_type: Debug (default) or Release"
    echo "VERBOSE=1: Enable verbose output to build/verbose_output.log"
    echo "executable_name: Name of the executable to run (default: main_executable)"
    echo "compiler: Specify 'clang' to use Clang, otherwise g++ is used"
    exit 0
fi

BUILD_TYPE=${1:-Debug} # Default to Debug if no argument is provided
VERBOSE=${2:-}
COMPILER=${3:-g++}
EXECUTABLE=${4:-main_executable}

# Convert input to lowercase
COMPILER=$(echo "$COMPILER" | tr '[:upper:]' '[:lower:]')
VERBOSE=$(echo "$VERBOSE" | tr '[:upper:]' '[:lower:]')

# Set the compiler
if [[ "$COMPILER" == "clang" ]]; then
    export CC=clang
    export CXX=clang++
else
    export CC=gcc
    export CXX=g++
fi

# Clean build directory
rm -rf build
mkdir -p build

# Function to handle build errors and rerun with verbose logging
handle_error() {
    echo "Build failed. Rerunning with verbose output..."
    cmake --build build --verbose > build/verbose_output.log 2>&1
    exit 1 
}

# Set a trap to call the handle_error function on any error
trap 'handle_error' ERR

# Run CMake and Make
cmake -S . -B build -DCMAKE_BUILD_TYPE="$BUILD_TYPE" -DEXECUTABLE_NAME="$EXECUTABLE" 
if [ "$VERBOSE" == "verbose=1" ]; then
    cmake --build build --verbose > build/verbose_output.log 2>&1
else
    cmake --build build
fi

# If the build is successful, clear the trap
trap - ERR

# Run the executable
./build/"$EXECUTABLE"

# Echo a success message
echo $'Build and execution success.\n'