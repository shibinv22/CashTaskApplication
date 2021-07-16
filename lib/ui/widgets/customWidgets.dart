import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/utils/constants.dart';

//Loading...
class Loading extends StatelessWidget {
  final Color? color;
  final String text;
  Loading({
    this.color = AppColors.appColor,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          SizedBox(
            height: 8.0,
          ),
          CircularProgressIndicator(
            color: color,
          ),
        ],
      ),
    );
  }
}

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
  final void Function()? onPressed;
  final double padding;

  const CustomButton({
    this.text,
    this.onPressed,
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
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

class LoginSplash extends StatelessWidget {
  final void Function()? onPressed;

  LoginSplash({
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      padding: EdgeInsets.all(15.0),
      borderSide: BorderSide(color: AppColors.appColor),
      highlightedBorderColor: AppColors.appColor,
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: TextStyle(color: AppColors.appColor),
          )
        ],
      ),
    );
  }
}

//BoldTextField
class TitleTextField extends StatelessWidget {
  final String text;
  final double padding;
  final Color textColor;
  final double? fontSize;
  final void Function()? onTap;

  TitleTextField({
    required this.text,
    this.padding = 20.0,
    this.textColor = Colors.black,
    this.fontSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
                fontSize: fontSize,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

//OtpBox
class OtpBox extends StatelessWidget {
  final bool incorrectOtp;
  final TextEditingController controller;
  final String? Function(String?) validation;

  OtpBox({
    required this.incorrectOtp,
    required this.controller,
    required this.validation,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 10.0),
        child: TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.always,
          validator: validation,
          showCursor: false,
          maxLength: 6,
          keyboardType: TextInputType.number,
          // ignore: deprecated_member_use
          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          textAlign: TextAlign.center,
          decoration: incorrectOtp
              ? InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          new BorderSide(color: Colors.pink, width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 2.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 2.0)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 2.0)),
                  fillColor: Colors.grey[200],
                )
              : InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
        ),
      ),
    );
  }
}

class RecentTransactionsTextField extends StatelessWidget {
  final String text;

  final double? fontSize;

  RecentTransactionsTextField({
    required this.text,
    this.fontSize = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              fontSize: fontSize,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
