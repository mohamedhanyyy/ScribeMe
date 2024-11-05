import 'package:easy_localization/easy_localization.dart';

extension StringExtenstions on String {
  emailValidator(String? value) {
    // Regular expression for validating an email
    const String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final RegExp regex = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'email is required'.tr();
    } else if (!regex.hasMatch(value)) {
      return 'enter a valid email address'.tr();
    } else {
      return null;
    }
  }

  phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'phone is required'.tr();
    }
    if (value.length < 10) {
      return 'enter valid phone number'.tr();
    } else {
      return null;
    }
  }

  String? nameValidator(String? value) {
    // Ensure the name is not empty and has a reasonable length
    if (value == null || value.isEmpty) {
      return 'name is required'.tr();
    } else if (value.length < 2) {
      return 'name must be at least 2 characters'.tr();
    } else {
      return null;
    }
  }

  String? passwordValidator(String? value) {
    // Password must be at least 8 characters and contain letters, numbers, and special characters
    // const String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$';
    // final RegExp regex = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'password is required'.tr();
    }
    // else if (!regex.hasMatch(value)) {
    //   return 'password must be at least 8 characters, include letters and numbers'
    //       .tr();
    // }
    else {
      return null;
    }
  }

  String? confirmPasswordValidator(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'confirm password is required'.tr();
    }
    if (value != password) {
      return 'passwords do not match'.tr();
    }
    return null;
  }
}
