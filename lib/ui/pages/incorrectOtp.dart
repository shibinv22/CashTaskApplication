import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/ui/widgets/customButton.dart';
import 'package:untitled1/ui/widgets/otpBox.dart';
import 'package:untitled1/ui/widgets/repeatingTexts/dummyNumber.dart';
import 'package:untitled1/ui/widgets/repeatingTexts/otpdigit.dart';
import 'package:untitled1/ui/widgets/repeatingTexts/resendTextFields.dart';
import 'package:untitled1/ui/widgets/textHeading.dart';
import 'package:untitled1/utils/constants.dart';

class IncorrectOtpPage extends StatelessWidget {
  const IncorrectOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 110.0),
              Container(child: Image(image: AssetImage(ImageData.otpFailure))),
              SizedBox(height: 5.0),
              DummyNumber(color: Colors.pink),
              SizedBox(height: 10.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleTextField(
                    text: 'Incorrect Code,',
                    fontSize: 20.0,
                  ),
                  SizedBox(height: 2.0),
                  TitleTextField(
                    text: "Please try Again",
                    fontSize: 20.0,
                  ),
                  SizedBox(height: 30.0),
                  ResendOTP(),
                ],
              ),
              OtpBox(
                inputDecoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          new BorderSide(color: Colors.pink, width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 2.0)),
                  fillColor: Colors.grey[200],
                ),
              ),
              ResendToNumberText(),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: CustomButton(text: 'Try Again', onBtnPressed: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
