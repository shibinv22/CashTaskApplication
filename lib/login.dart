import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/custom_widgets.dart';
import 'package:untitled1/otp.dart';

import 'network/api.dart';

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
            Container(
                child: Image(image: AssetImage('assets/mercury_logo.png'))),
            Expanded(
                child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 10.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 305.0),
                            child: Container(
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.grey[200],
                              filled: true,
                              hintText: 'Enter your Email',
                            ),
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email cannot be blank';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 280.0),
                            child: Container(
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.grey[200],
                                filled: true,
                                hintText: 'Enter password'),
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              } else if (value.length < 6) {
                                return 'Password should be atleast 6 characters ';
                              } else if (value.length > 15) {
                                return "Password should not be greater than 15 characters";
                              }
                              return null;
                            },
                          ),
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
                                    color: Color(0xff2FC3C5),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(height: 35.0),
                          CustomButton(
                            btnText: 'Login',
                            onBtnPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                var email = emailController.text;
                                var password = passwordController.text;
                                setState(() {
                                  message = 'Please wait...';
                                });
                                var res = await loginUser(email, password);
                                if (res.containsKey('status')) {
                                  setState(() {
                                    message = res['status_text'];
                                  });
                                  if (res['status' == 200]) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return OtpPage();
                                    }));
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
                                    color: Color(0xff2FC3C5),
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
