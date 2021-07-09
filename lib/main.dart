//--no-sound-null-safety
import 'package:flutter/material.dart';
import 'package:untitled1/ui/pages/incorrectOtp.dart';
import 'package:untitled1/ui/pages/login.dart';
import 'package:untitled1/ui/pages/otp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IncorrectOtpPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
