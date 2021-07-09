import 'package:flutter/material.dart';

class TitleTextField extends StatelessWidget {
  final String text;
  final double padding;
  final Color textColor;
  final double? fontSize;

  TitleTextField({
    required this.text,
    this.padding = 20.0,
    this.textColor = Colors.black,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
              fontSize: fontSize,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
