class MyValidation{

  static bool isEmail(String email) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
  static bool isPhoneNumber(String phoneNumber) {
    return RegExp(r'^[0-9]{11}$').hasMatch(phoneNumber);
  }

  static bool is8Characters(String password) {
    return RegExp(r'^.{8,}$').hasMatch(password);
  }

  static bool isUpperCase(String password) {
    return RegExp(r'[A-Z]').hasMatch(password);
  }

  static bool isLowerCase(String password) {
    return RegExp(r'[a-z]').hasMatch(password);
  }

  static bool isDigit(String password) {
    return RegExp(r'[0-9]').hasMatch(password);
  }
}