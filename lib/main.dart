import 'package:flutter/material.dart';
import 'package:untitled1/ui/pages/dashboard.dart';
import 'package:untitled1/ui/pages/dummy.dart';
import 'package:untitled1/ui/pages/incorrectOtp.dart';
import 'package:untitled1/ui/pages/login.dart';

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
