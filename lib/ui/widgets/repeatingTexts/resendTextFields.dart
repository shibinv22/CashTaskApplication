import 'package:flutter/material.dart';
import 'package:untitled1/ui/widgets/textHeading.dart';
import 'package:untitled1/utils/constants.dart';

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
