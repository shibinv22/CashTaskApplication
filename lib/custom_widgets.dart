import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final Function? onBtnPressed;
  CustomButton({required this.btnText, required this.onBtnPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              btnText,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      color: Color(0xff2FC3C5),
      onPressed: () => onBtnPressed,
      shape: const StadiumBorder(),
    );
  }
}
