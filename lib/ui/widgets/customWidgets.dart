import 'package:flutter/material.dart';
import 'package:untitled1/utils/constants.dart';

//InputFormField
class CustomTextFormField extends StatelessWidget {
  final bool autovalidate;
  final String? Function(String?) validation;
  final TextEditingController controller;
  final String? hintText;
  final InputBorder? inputBorder;

  CustomTextFormField({
    this.autovalidate = true,
    required this.validation,
    required this.controller,
    this.hintText,
    this.inputBorder,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.grey[200],
        filled: true,
        hintText: hintText,
      ),
      controller: controller,
      validator: validation,
    );
  }
}

//CustomButton
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

//BoldTextField
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
