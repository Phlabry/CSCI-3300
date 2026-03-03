@echo off
REM Setup script for TDD Workshop (Windows CMD)
REM Checks Python version and installs dependencies to system Python (no virtual environment)

setlocal enabledelayedexpansion

echo ==========================================
echo TDD Workshop - Environment Setup
echo ==========================================
echo.

REM Check if Python is installed (try 'python' first, then 'py')
python --version >nul 2>&1
if errorlevel 1 (
    py --version >nul 2>&1
    if errorlevel 1 (
        echo [ERROR] Python is not installed or not in PATH
        echo Please install Python 3 from https://www.python.org/
        exit /b 1
    ) else (
        set PYTHON_CMD=py
    )
) else (
    set PYTHON_CMD=python
)

REM Get Python version
for /f "tokens=2" %%v in ('%PYTHON_CMD% --version 2^>^&1') do set PYTHON_VERSION=%%v

REM Check Python version (basic check - assumes format "3.x.x")
REM Extract major version number
for /f "tokens=1 delims=." %%a in ("%PYTHON_VERSION%") do (
    set MAJOR=%%a
)

REM Remove any spaces from version number
set MAJOR=%MAJOR: =%

REM Check version using numeric comparison - just verify it's Python 3
set /a MAJOR_NUM=%MAJOR% 2>nul

if %MAJOR_NUM% LSS 3 (
    echo [ERROR] Python 3 is required
    echo Current version: %PYTHON_VERSION%
    exit /b 1
)

echo [OK] Python version: %PYTHON_VERSION%

REM Check if pip is available
%PYTHON_CMD% -m pip --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] pip is not installed or not in PATH
    echo Please install pip for Python 3
    exit /b 1
)

echo [OK] pip is available

REM Upgrade pip
echo.
echo Upgrading pip...
%PYTHON_CMD% -m pip install --quiet --upgrade pip
if errorlevel 1 (
    echo [ERROR] Failed to upgrade pip
    exit /b 1
)

REM Install dependencies
echo.
echo Installing dependencies from requirements.txt...
if not exist "requirements.txt" (
    echo [ERROR] requirements.txt not found
    exit /b 1
)

%PYTHON_CMD% -m pip install --quiet -r requirements.txt
if errorlevel 1 (
    echo [ERROR] Failed to install dependencies
    exit /b 1
)
echo [OK] Dependencies installed

REM Verify pytest installation
echo.
echo Verifying pytest installation...
%PYTHON_CMD% -m pytest --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] pytest verification failed
    exit /b 1
)

for /f "tokens=2" %%v in ('%PYTHON_CMD% -m pytest --version 2^>^&1') do set PYTEST_VERSION=%%v
echo [OK] pytest !PYTEST_VERSION! is installed

REM Verify pytest-cov installation
%PYTHON_CMD% -m pytest --cov --help >nul 2>&1
if errorlevel 1 (
    echo [ERROR] pytest-cov verification failed
    exit /b 1
)
echo [OK] pytest-cov is installed

echo.
echo ==========================================
echo [OK] Setup complete!
echo ==========================================
echo.
echo Next steps:
echo 1. Run tests: python -m pytest (or py -m pytest if python is not available)
echo 2. Run tests with coverage: python -m pytest --cov=task --cov-report=term-missing
echo.

endlocal
