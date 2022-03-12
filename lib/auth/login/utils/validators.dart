String? inputValidator(String? value, String errorMessage) {
  if (value == null || value.isEmpty) {
    return errorMessage;
  }
  return null;
}

String? passwordValidator(String? value, int requiredLength) {
  if (value == null || value.length < requiredLength) {
    return 'Enter password at least $requiredLength characters long';
  }
  return null;
}

String? passwordConfirmationValidator(
    String? value, String? value2, int requiredLength) {
  if (value == null || value.length < requiredLength) {
    return 'Enter password at least $requiredLength characters long';
  }
  if (value != value2) {
    return 'Passwords do not match';
  }
  return null;
}
