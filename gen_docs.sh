#!/bin/bash

# Exit if a command exits with a non-zero status
set -e

# Check if Doxygen is installed
command -v doxygen >/dev/null 2>&1 ||
    { echo >&2 "Doxygen is required, but it's not installed, aborting."; exit 1; }

# Directory for Doxygen output
DOCS_DIR="docs"
mkdir -p "$DOCS_DIR"

# Run Doxygen
echo "Generating documentation..."
doxygen Doxyfile

# Check if documentation was generated successfully
if [ -d "$DOCS_DIR/html" ]; then
    echo "Documentation generated in $DOCS_DIR/html"
else
    echo "Failed to generate documentation."
    exit 1
fi