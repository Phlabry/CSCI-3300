import pytest
from task import create_task

# First test: Create a task with a title
def test_create_task_with_title():
    task = create_task("Buy groceries")
    assert task.title == "Buy groceries"
