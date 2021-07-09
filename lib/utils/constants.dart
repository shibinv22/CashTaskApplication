import 'package:flutter/cupertino.dart';

class Texts {
  static const String login = 'Hello';
}

class ImageData {
  static const String imagePath = "assets/images/";
  static const String pathExtension = '.png';

  static const String logo = '${imagePath}mercury_logo$pathExtension';
  static const String otpSuccess = '${imagePath}correct_otp$pathExtension';
  static const String otpFailure = '${imagePath}incorrect_otp$pathExtension';
}

class AppColors {
  static const Color appColor = const Color(0xff2FC3C5);
}

class StringFunctions {
  //Email validation
  static String? Function(String?) emailValidation = (value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be blank';
    } else if (!value.contains('@') || (value.length < 4)) {
      return 'Not a valid Email';
    }
    return null;
  };

//Password Validation
  static String? Function(String?) passwordValidation = (value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password should be atleast 6 characters ';
    } else if (value.length > 20) {
      return "Password should not be greater than 20 characters";
    }
    return null;
  };
}
