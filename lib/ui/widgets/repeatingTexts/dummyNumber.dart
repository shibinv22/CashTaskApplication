import 'package:flutter/material.dart';

class DummyNumber extends StatelessWidget {
  final Color color;

  DummyNumber({required this.color});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 10.0,
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          '+91 ***** *4578',
          style: TextStyle(fontSize: 8.0),
        ),
      ),
      color: color,
      shape: const StadiumBorder(),
    );
  }
}
