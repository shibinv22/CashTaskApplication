import 'package:flutter/material.dart';
import 'package:untitled1/model/otpResponse.dart';
import 'package:untitled1/network/api.dart';
import 'package:untitled1/ui/pages/dashboard.dart';
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
  final OtpResponse otpResponse = OtpResponse();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                    filled: true),
                controller: otpController,
                validation: StringFunctions.otpValidation,
              ),
              ResendToNumberText(),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: CustomButton(
                  text: 'Verify',
                  onBtnPressed: otpCheckMethod,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void otpCheckMethod() {
    var token = otpController.text;
    setState(() async {
      message = 'Please wait...';
      var res = await api.userOTP('otp', token);
      print(res);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DashBoard();
      }));
    });
  }
}
