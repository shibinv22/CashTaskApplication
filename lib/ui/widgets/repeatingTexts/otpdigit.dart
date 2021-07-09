import 'package:flutter/material.dart';

import '../textHeading.dart';

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
