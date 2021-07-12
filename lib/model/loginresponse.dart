// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.answerToken,
    this.providers,
  });

  String? answerToken;
  List<String>? providers;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        answerToken: json["answer_token"],
        providers: List<String>.from(json["providers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "answer_token": answerToken,
        "providers": List<dynamic>.from(providers!.map((x) => x)),
      };
}
