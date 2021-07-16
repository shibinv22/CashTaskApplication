import 'package:flutter/material.dart';
import 'package:untitled1/ui/pages/login.dart';
import 'package:untitled1/ui/widgets/customRepeatingTexts.dart';
import 'package:untitled1/ui/widgets/customWidgets.dart';
import 'package:untitled1/utils/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 150.0),
              child: Image.asset(Images.logo)),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ApplicationName(
                text: 'mercury.',
                color: Colors.black,
              ),
              ApplicationName(
                text: 'cash',
                color: AppColors.appColor,
              ),
            ],
          ),
          SizedBox(height: 100.0),
          TitleTextField(
            text: 'Buy,Send And Exchange',
            textColor: Colors.grey,
          ),
          TitleTextField(
            text: 'Flat Currency With',
            textColor: Colors.grey,
          ),
          TitleTextField(
            text: 'CryptoCurrency',
            textColor: Colors.grey,
          ),
          SizedBox(height: 100.0),
          Padding(
            padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 10.0),
            child: CustomButton(
              text: 'Signup',
              padding: 15.0,
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text('Feature coming soon...'),
                  backgroundColor: AppColors.appColor,
                  duration: const Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 10.0),
            child: LoginSplash(onPressed: onTap),
          )
        ],
      ),
    );
  }

  void onTap() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }
}
