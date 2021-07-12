import 'package:flutter/material.dart';
import 'package:untitled1/ui/widgets/customWidgets.dart';
import 'package:untitled1/utils/constants.dart';

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

class ResendOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        TitleTextField(text: 'Enter the 6 digit code sent to your'),
        SizedBox(height: 2.0),
        TitleTextField(text: 'mobile number'),
      ],
    ));
  }
}

class ResendToNumberText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleTextField(text: "Didn't get your code?,"),
              SizedBox(width: 2.0),
              TitleTextField(
                text: "Click here",
                textColor: AppColors.appColor,
              ),
              SizedBox(width: 2.0),
              TitleTextField(text: "to send a"),
            ],
          ),
          SizedBox(height: 2.0),
          TitleTextField(text: 'new one'),
        ],
      ),
    );
  }
}
