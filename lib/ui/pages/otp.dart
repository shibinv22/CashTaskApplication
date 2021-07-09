import 'package:flutter/material.dart';
import 'package:untitled1/ui/widgets/customButton.dart';
import 'package:untitled1/ui/widgets/otpBox.dart';
import 'package:untitled1/ui/widgets/repeatingTexts/dummyNumber.dart';
import 'package:untitled1/ui/widgets/repeatingTexts/otpdigit.dart';
import 'package:untitled1/ui/widgets/repeatingTexts/resendTextFields.dart';
import 'package:untitled1/ui/widgets/textHeading.dart';
import 'package:untitled1/utils/constants.dart';

class OtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 110.0),
            Container(child: Image(image: AssetImage(ImageData.otpSuccess))),
            SizedBox(height: 5.0),
            DummyNumber(color: AppColors.appColor),
            SizedBox(height: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleTextField(
                  text: 'We Sent A SMS Code To',
                  fontSize: 20.0,
                ),
                SizedBox(height: 2.0),
                TitleTextField(
                  text: "Your Phone Number",
                  fontSize: 20.0,
                ),
                SizedBox(height: 30.0),
                ResendOTP(),
              ],
            ),
            OtpBox(
                inputDecoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.grey[200],
                    filled: true)),
            ResendToNumberText(),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: CustomButton(text: 'Verify', onBtnPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
