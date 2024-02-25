class ValidEmailPassword {
  bool isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );
    return emailRegExp.hasMatch(email);
  }

  bool isValidPassword(String password) {
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
      caseSensitive: true,
      multiLine: false,
    );

    return passwordRegExp.hasMatch(password);
  }
}
