import 'package:flutter/material.dart';
import 'package:untitled1/utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final void Function()? onBtnPressed;
  final double padding;

  const CustomButton({
    this.text,
    this.onBtnPressed,
    this.padding = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text ?? '',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      color: AppColors.appColor,
      onPressed: onBtnPressed,
      shape: const StadiumBorder(),
    );
  }
}
