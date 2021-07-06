import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;
  CustomButton({required this.btnText,required this.onBtnPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {onBtnPressed;},
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}
