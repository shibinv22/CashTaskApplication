import 'package:flutter/material.dart';
import 'package:untitled1/ui/pages/login.dart';
import 'package:untitled1/ui/pages/otp.dart';

class RouteManager {
  static const String loginPage = '/';
  static const String otpPage = '/otpPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );

      case otpPage:
        return MaterialPageRoute(
          builder: (context) => OtpPage(),
        );

      default:
        throw FormatException('Erroe in route');
    }
  }
}
