String? emailValidator(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Please enter a valid email address';
  else
    return null;
}

String? passwordValidator(String? value) {
  String pattern = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'A password must contain at least 8 characters, at least one letter and one number.';
  else
    return null;
}

String? passwordValidatorOnSignIn(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password must not be empty';
  } else
    return null;
}

String? displayNameValidator(String? value) {
  String pattern =
      r"^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){3,18}[a-zA-Z0-9]$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Please enter a valid display name';
  } else {
    return null;
  }
}
