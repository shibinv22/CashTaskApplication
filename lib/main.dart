//--no-sound-null-safety
import 'package:flutter/material.dart';
import 'package:untitled1/dashboard.dart';
import 'package:untitled1/dummy.dart';
import 'package:untitled1/incorrect_otp.dart';
import 'package:untitled1/login.dart';
import 'package:untitled1/otp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashBoard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
