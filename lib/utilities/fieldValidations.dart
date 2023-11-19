abstract class FormValidator {

  // -> Username

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (value.length < 3) {
      return 'Username must be at least 3 characters long';
    }
    return null;
  }

 // -> Email

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'E-mail is required';
    }
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Invalid E-mail format';
    }
    return null;
  }

  // -> Password

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  // -> Password Confirmation

  static String? validatePasswordConfirmation(String? password, String? confirmation) {
    if (confirmation == null || confirmation.isEmpty) {
      return 'Password confirmation is required';
    }
    if (password != confirmation) {
      return 'Passwords do not match';
    }
    return null;
  }
}
