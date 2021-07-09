import 'package:flutter/cupertino.dart';

class Texts {
  static const String login = 'Hello';
}

class Images {
  static const String imagePath = 'assets/images/';
  static const String pathExtension = '.png';

  static const String logo = '${imagePath}mercury_logo$pathExtension';
  static const String otpSuccess = '${imagePath}correct_otp$pathExtension';
  static const String otpFailure = '${imagePath}incorrect_otp$pathExtension';
}

class AppColors {
  static const Color appColor = const Color(0xff2FC3C5);
}
