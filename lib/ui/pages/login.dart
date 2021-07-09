import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/network/api.dart';
import 'package:untitled1/ui/pages/otp.dart';
import 'package:untitled1/ui/widgets/textHeading.dart';
import 'package:untitled1/ui/widgets/text_form_field.dart';
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 140.0),
            Image(image: AssetImage(ImageData.logo)),
            Expanded(
                child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 10.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: TitleTextField(text: 'Email')),
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
                              SizedBox(width: 2.0),
                              TitleTextField(
                                text: 'Password?',
                                textColor: AppColors.appColor,
                              ),
                            ],
                          ),
                          SizedBox(height: 35.0),
                          MaterialButton(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            color: AppColors.appColor,
                            shape: const StadiumBorder(),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                var email = emailController.text;
                                var password = passwordController.text;
                                setState(() {
                                  message = 'Please wait...';
                                });
                                var res = await loginUser(email, password);
                                var jsonResponse = null;
                                if (res.containsKey('status')) {
                                  setState(() {
                                    message = 'Loading....';
                                    String jsonObj = jsonEncode(res);
                                    print(jsonObj);
                                  });
                                  if (res['status'] == 200) {
                                    jsonResponse = json.decode(res);
                                    if (jsonResponse != null) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return OtpPage();
                                      }));
                                    }
                                  } else {
                                    message = 'Error....';
                                  }
                                }
                              }
                            },
                          ),
                          SizedBox(height: 10.0),
                          Text(message),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TitleTextField(text: "Don't have an account?"),
                              SizedBox(width: 5.0),
                              TitleTextField(
                                text: 'Sign Up',
                                textColor: AppColors.appColor,
                                fontSize: 15.0,
                              ),
                            ],
                          )
                        ],
                      )),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
