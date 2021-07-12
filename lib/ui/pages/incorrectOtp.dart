import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/network/api.dart';
import 'package:untitled1/ui/pages/dashboard.dart';
import 'package:untitled1/ui/widgets/customWidgets.dart';
import 'package:untitled1/ui/widgets/customRepeatingTexts.dart';
import 'package:untitled1/utils/constants.dart';

class IncorrectOtpPage extends StatefulWidget {
  const IncorrectOtpPage({Key? key}) : super(key: key);

  @override
  _IncorrectOtpPageState createState() => _IncorrectOtpPageState();
}

class _IncorrectOtpPageState extends State<IncorrectOtpPage> {
  final otpController = TextEditingController();
  String message = '';

  // final OtpPage otp

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
                controller: otpController,
                inputDecoration: InputDecoration(
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
                ),
                validation: StringFunctions.otpValidation,
              ),
              SizedBox(height: 20.0),
              ResendToNumberText(),
              Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: CustomButton(
                    text: 'Try Again',
                    onBtnPressed: otpCheckMethod,
                  )),
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
      ApiService api = ApiService();
      var res = await api.userOTP('otp', token);
      print(res);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DashBoard();
      }));
    });
  }
}
