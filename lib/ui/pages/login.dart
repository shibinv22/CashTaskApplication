import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/network/api.dart';
import 'package:untitled1/ui/pages/otp.dart';
import 'package:untitled1/ui/widgets/customWidgets.dart';
import 'package:untitled1/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message = '';
  final ApiService api = ApiService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 110.0),
              child: Image.asset(Images.logo),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 10.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: TitleTextField(text: 'Email'),
                    ),
                    SizedBox(height: 10.0),
                    CustomTextFormField(
                      hintText: 'Enter your Email',
                      validation: StringFunctions.emailValidation,
                      controller: emailController,
                    ),
                    SizedBox(height: 20.0),
                    Align(
                        alignment: Alignment.topLeft,
                        child: TitleTextField(text: 'Password')),
                    SizedBox(height: 10.0),
                    CustomTextFormField(
                      hintText: 'Enter your password',
                      validation: StringFunctions.passwordValidation,
                      controller: passwordController,
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        TitleTextField(text: 'Forgot'),
                        SizedBox(width: 3.0),
                        TitleTextField(
                          text: 'Password?',
                          textColor: AppColors.appColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    CustomButton(
                      text: 'Login',
                      padding: 15.0,
                      onPressed: login,
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TitleTextField(
                          text: "Don't have an account?",
                          fontSize: 12.0,
                        ),
                        SizedBox(width: 5.0),
                        TitleTextField(
                          text: 'Sign Up',
                          textColor: AppColors.appColor,
                          fontSize: 12.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  login() async {
    if (_formKey.currentState!.validate()) {
      var email = emailController.text;
      var password = passwordController.text;
      var res = await api.loginUser(email, password, "2", 2);
      if (res.answerToken != null && res.answerToken!.isNotEmpty) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return OtpPage();
        }));
      } else {
        setState(() {
          message = 'Incorrect credetials...try again';
        });
        return Container();
      }
    }
  }
}
