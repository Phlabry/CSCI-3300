import unittest
from passwords import password_strength

class TestPasswordStrength(unittest.TestCase):
    def test_empty_string(self):
        self.assertEqual(password_strength(""), "weak")

    def test_letters_only_short(self):
        self.assertEqual(password_strength("abcdefg"), "weak")

    def test_letters_digits_medium(self):
        self.assertEqual(password_strength("abc12345"), "medium")

    def test_strong_password(self):
        self.assertEqual(password_strength("abc12345!!xx"), "strong")

    def test_non_string_input(self):
        with self.assertRaises(TypeError):
            password_strength(123)

if __name__ == "__main__":
    unittest.main()
