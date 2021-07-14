import 'package:flutter/material.dart';
import 'package:untitled1/network/api.dart';
import 'package:untitled1/ui/pages/home/homeScreen.dart';
import 'package:untitled1/ui/widgets/customWidgets.dart';
import 'package:untitled1/ui/widgets/customRepeatingTexts.dart';
import 'package:untitled1/utils/constants.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final ApiService api = ApiService();
  final otpController = TextEditingController();
  String message = '';
  bool incorrectOtp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 110.0),
              Image.asset(incorrectOtp ? Images.otpFailure : Images.otpSuccess),
              SizedBox(height: 5.0),
              DummyNumber(
                color: incorrectOtp ? Colors.pink : AppColors.appColor,
              ),
              SizedBox(height: 10.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleTextField(
                    text: incorrectOtp
                        ? 'Incorrect Code,'
                        : 'We Sent A SMS Code To',
                    fontSize: 20.0,
                  ),
                  SizedBox(height: 2.0),
                  TitleTextField(
                    text:
                        incorrectOtp ? 'Please try Again' : 'Your Phone Number',
                    fontSize: 20.0,
                  ),
                  SizedBox(height: 30.0),
                  ResendOTP(),
                ],
              ),
              OtpBox(
                incorrectOtp: incorrectOtp,
                controller: otpController,
                validation: StringFunctions.otpValidation,
              ),
              ResendToNumberText(),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: CustomButton(
                  text: incorrectOtp ? 'Try Again' : 'Verify',
                  onPressed: otpCheck,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void otpCheck() async {
    var token = otpController.text;
    var res = await api.userOTP('otp', token);
    print(res);
    setState(() {
      incorrectOtp = res.message != null && res.message == 'Authorization Fail';
    });

    if (!incorrectOtp &&
        res.accessToken != null &&
        res.accessToken!.isNotEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
