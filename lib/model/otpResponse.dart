// To parse this JSON data, do
//
//     final otpResponse = otpResponseFromJson(jsonString);

import 'dart:convert';

OtpResponse otpResponseFromJson(String str) =>
    OtpResponse.fromJson(json.decode(str));

String otpResponseToJson(OtpResponse data) => json.encode(data.toJson());

class OtpResponse {
  OtpResponse({this.accessToken, this.refreshToken, this.message, this.status});

  String? accessToken;
  String? refreshToken;
  String? message;
  int? status;

  factory OtpResponse.fromJson(Map<String, dynamic> json) => OtpResponse(
      accessToken: json["access_token"],
      refreshToken: json["refresh_token"],
      message: json['message'],
      status: json['status']);

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "message": message,
        "status": status,
      };
}
