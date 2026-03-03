def password_strength(pw: str) -> str:
    if not isinstance(pw, str):
        raise TypeError("password must be a string")

    has_letter = any(c.isalpha() for c in pw)
    has_digit  = any(c.isdigit() for c in pw)
    has_symbol = any(not c.isalnum() for c in pw)
    # or this
    # symbols = "!@#$%^&*()-_=+[]{};:,.?"
    # has_symbol = any(c in symbols for c in pw)

    if len(pw) >= 12 and has_letter and has_digit and has_symbol:
        return "strong"

    if len(pw) >= 8 and has_letter and has_digit:
        return "medium"

    return "weak"
    