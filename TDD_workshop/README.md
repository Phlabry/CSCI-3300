# TDD Workshop: Building a Task Manager

Welcome! This repository is designed for a hands-on Test-Driven Development (TDD) workshop. You'll learn TDD by building a simple task management system, one test at a time.

## What You'll Learn

- How to write tests **before** writing code
- The RED → GREEN → REFACTOR cycle
- How tests encode requirements
- How to refactor with confidence
- The value of test coverage

## Prerequisites

- Python 3
- pip (usually comes with Python)
- Basic Python knowledge (functions, classes, exceptions)
- A terminal/command prompt

## Quick Start

### 1. Set Up Your Environment

**Windows:**
```cmd
setup.bat
```

**Unix/macOS:**
```bash
chmod +x setup.sh
./setup.sh
```

This will:
- Check your Python version
- Install pytest and pytest-cov to your system Python

### 2. Run Tests

From the project root directory, run:

**With coverage:**
```bash
python -m pytest --cov=task --cov-report=term-missing
```

**Without coverage (faster):**
```bash
python -m pytest
```

> **Note:** 
> - On Unix/macOS, you may need to use `python3` instead of `python`
> - On Windows, some systems use `py` as an alias for `python` (e.g., `py -m pytest` works the same as `python -m pytest`)

You should see a **failing test** (RED). This is expected and correct!

## The TDD Cycle

Follow this cycle for every feature:

1. **RED**: Write a failing test
   - Run the test
   - Watch it fail
   - Understand why it fails

2. **GREEN**: Write the minimal code to pass
   - Make the test pass
   - Nothing more, nothing less

3. **REFACTOR** (also called "CHANGE" or "BLUE"):
   - Improve the code
   - Keep all tests green
   - Make the design better

## Rules of Engagement

### DO

- Write tests first
- Run tests frequently
- Watch tests fail before making them pass
- Refactor only when tests are green
- Keep tests simple and focused
- One concept per test

### DON'T

- Skip the RED phase
- Write code without a failing test
- Refactor when tests are failing
- Write multiple features in one test
- Optimize prematurely

## Common Pitfalls

### "I don't know what to test"
Start with the simplest thing. Can you create a task? Test that first.

### "My test passes immediately"
You might have written the implementation before the test. Delete the implementation and start over with just the test.

### "I want to add more features"
Great! Write a test for it first. One feature at a time.

### "My code is messy"
Perfect time to refactor! But only after all tests are green.

## Project Structure

```
├── task.py           # Your implementation (start empty or minimal)
├── test_task.py      # Your tests (start with one failing test)
├── setup.bat         # Windows setup script
├── setup.sh          # Unix/macOS setup script
├── requirements.txt  # Dependencies
└── README.md         # This file
```

## Getting Help

- Read test error messages carefully
- Check what the test is actually testing
- Make sure you understand the requirement before coding
- Ask questions during the session

## Next Steps

1. Run the setup script (`setup.bat` on Windows, `setup.sh` on Unix/macOS)
2. Run `python -m pytest` and see the test fail
4. Follow along with the instructor
5. Experience the RED → GREEN → REFACTOR cycle

Remember: **Tests are your safety net**. They let you change code with confidence.

Happy coding!
