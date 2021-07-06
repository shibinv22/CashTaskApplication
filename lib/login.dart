import 'package:flutter/material.dart';
import 'package:untitled1/custom_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController =TextEditingController();
  final passwordController =TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/mercury_logo.svg'),
            Expanded(child: ListView(children: [
              Padding(padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Form(key:_formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email'),
                    controller: emailController,
                    validator: (value){
                        if(value!.isNotEmpty){
                          return 'Email cannot be empty..';
                        }
                        return null;
                    },),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password'),
                      controller: passwordController,
                      validator: (value){
                        if(value!.isNotEmpty){
                          return 'Password cannot be empty..';
                        }
                        return null;
                      },),
                    SizedBox(height: 10.0,),
                   CustomButton(btnText: 'Login',
                     onBtnPressed:(){} ,),
                  ],
                )
                ),
              )],
            )
            ),
          ],),
      ),
    );
  }
}
