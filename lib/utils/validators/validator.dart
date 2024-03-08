class CcValidator {
  // emppty text validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'email is required';
    }

    // regex for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'invalid email address';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'password is required';
    }

    // check min password length
    if (value.length < 6) {
      return 'password must be atleast 6 characters long';
    }

    // check for uppercase letters
    // if (!value.contains(RegExp(r'[A-Z]'))) {
    //   return 'password must contain at least one uppercase letter';
    // }

    // check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'password must contain at least one number';
    }

    // check for special characters
    // if (!value.contains(RegExp(r'[!@#$%^&*(),./":{|<>}]'))) {
    //   return 'password must contain at least one special character';
    // }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'phone number is required';
    }

    // regex for phone number validation (assuming 10-digit Tanzania phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'invalid phone number format (10 digits required)';
    }

    return null;
  }
  // more custom validators
}
