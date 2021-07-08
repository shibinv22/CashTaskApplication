// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

class LoginResponseModel {
  final String answerToken;

  LoginResponseModel({required this.answerToken});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      answerToken: json["answer_token"] != null ? json["answer_token"] : '',
    );
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };
    return map;
  }
}
