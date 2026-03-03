#!/bin/bash

# Setup script for TDD Workshop
# Checks Python version and installs dependencies to system Python (no virtual environment)

set -e  # Exit on error

echo "=========================================="
echo "TDD Workshop - Environment Setup"
echo "=========================================="
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "[ERROR] Python 3 is not installed or not in PATH"
    echo "Please install Python 3 from https://www.python.org/"
    exit 1
fi

# Check Python version
PYTHON_VERSION=$(python3 --version 2>&1 | awk '{print $2}')
PYTHON_MAJOR=$(echo $PYTHON_VERSION | cut -d. -f1)

if [ "$PYTHON_MAJOR" -lt 3 ]; then
    echo "[ERROR] Python 3 is required"
    echo "Current version: $PYTHON_VERSION"
    exit 1
fi

echo "[OK] Python version: $PYTHON_VERSION"

# Check if pip is available
if ! command -v pip3 &> /dev/null; then
    echo "[ERROR] pip3 is not installed or not in PATH"
    echo "Please install pip for Python 3"
    exit 1
fi

echo "[OK] pip is available"

# Upgrade pip
echo ""
echo "Upgrading pip..."
python3 -m pip install --quiet --upgrade pip

# Install dependencies
echo ""
echo "Installing dependencies from requirements.txt..."
if [ -f "requirements.txt" ]; then
    python3 -m pip install --quiet -r requirements.txt
    echo "[OK] Dependencies installed"
else
    echo "[ERROR] requirements.txt not found"
    exit 1
fi

# Verify pytest installation
echo ""
echo "Verifying pytest installation..."
if python3 -m pytest --version &> /dev/null; then
    PYTEST_VERSION=$(python3 -m pytest --version 2>&1 | awk '{print $2}')
    echo "[OK] pytest $PYTEST_VERSION is installed"
else
    echo "[ERROR] pytest verification failed"
    exit 1
fi

# Verify pytest-cov installation
if python3 -m pytest --cov --help &> /dev/null; then
    echo "[OK] pytest-cov is installed"
else
    echo "[ERROR] pytest-cov verification failed"
    exit 1
fi

echo ""
echo "=========================================="
echo "[OK] Setup complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Run tests: python3 -m pytest"
echo "2. Run tests with coverage: python3 -m pytest --cov=task --cov-report=term-missing"
echo ""
