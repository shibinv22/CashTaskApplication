import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled1/ui/pages/splash.dart';

void main() {
  RenderErrorBox.backgroundColor = Colors.purple;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
