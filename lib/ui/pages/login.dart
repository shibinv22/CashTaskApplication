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

  String? Function(String?) emailValidation = (chuma) {
    if (chuma == null || chuma.isEmpty) {
      return 'Email cannot be blank';
    } else if (!chuma.contains('@') || (chuma.length < 4)) {
      return 'Not a valid Email';
    }
    return null;
  };

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
            Container(child: Image(image: AssetImage(ImageData.logo))),
            Expanded(
                child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 10.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TitleTextField(
                            text: 'Email',
                          ),
                          SizedBox(height: 10.0),
                          CustomTextFormField(
                              hintText: 'Enter your Email',
                              validation: StringFunctions.emailValidation,
                              controller: emailController),
                          // TextFormField(
                          //   autovalidate: true,
                          //   decoration: InputDecoration(
                          //     border: InputBorder.none,
                          //     fillColor: Colors.grey[200],
                          //     filled: true,
                          //     hintText: 'Enter your Email',
                          //   ),
                          //   controller: emailController,
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Email cannot be blank';
                          //     } else if (!value.contains('@') ||
                          //         (value.length < 4)) {
                          //       return 'Not a valid Email';
                          //     }
                          //     return null;
                          //   },
                          // ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TitleTextField(
                            text: 'Password',
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(right: 280.0),
                          //   child: Container(
                          //     child: Text(
                          //       'Password',
                          //       style: TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //       maxLines: 1,
                          //     ),
                          //   ),
                          // ),
                          SizedBox(height: 10.0),
                          CustomTextFormField(
                              hintText: 'Enter your password',
                              validation: StringFunctions.passwordValidation,
                              controller: passwordController),
                          // TextFormField(
                          //   autovalidate: true,
                          //   decoration: InputDecoration(
                          //       border: InputBorder.none,
                          //       fillColor: Colors.grey[200],
                          //       filled: true,
                          //       hintText: 'Enter password'),
                          //   controller: passwordController,
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Password is required';
                          //     } else if (value.length < 6) {
                          //       return 'Password should be atleast 6 characters ';
                          //     } else if (value.length > 20) {
                          //       return "Password should not be greater than 20 characters";
                          //     }
                          //     return null;
                          //   },
                          // ),
                          SizedBox(height: 15.0),
                          Row(
                            children: [
                              Text(
                                'Forgot',
                                maxLines: 1,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 3.0),
                              Text(
                                "Password?",
                                maxLines: 1,
                                style: TextStyle(
                                  color: AppColors.appColor,
                                  fontWeight: FontWeight.bold,
                                ),
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
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(message),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Sign Up',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: AppColors.appColor,
                                    fontWeight: FontWeight.bold),
                              )
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
