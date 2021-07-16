import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/model/loginResponse.dart';
import 'package:untitled1/model/otpResponse.dart';
import 'package:untitled1/model/recentTransactions.dart';
import 'package:untitled1/model/swipeCardsResponse.dart';
import 'package:untitled1/utils/constants.dart';

class ApiService {
  Future<LoginResponse> loginUser(
      String email, String password, String version, int os) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(
      Uri.parse(AppUrl.loginOtpUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'password': password,
        'version': version,
        'os': os,
      }),
    );
    if (response.statusCode == 200) {
      print('success');
      var convertedToJson = jsonDecode(response.body);
      sharedPreferences.setString(
          'answer_token', convertedToJson['answer_token']);
      return LoginResponse.fromJson(convertedToJson);
      // return convertedToJson;
    } else {
      var convertedToJson = jsonDecode(response.body);
      print('code error..');
      return LoginResponse.fromJson(convertedToJson);
    }
  }

  Future<OtpResponse> userOTP(String provider, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    late String? bearerToken = sharedPreferences.getString("answer_token");
    print(bearerToken);

    var otpResponse = await http.put(
      Uri.parse(AppUrl.loginOtpUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $bearerToken',
      },
      body: jsonEncode(<String, dynamic>{
        'provider': provider,
        'token': token,
      }),
    );
    if (otpResponse.statusCode == 200) {
      print('success');
      var convertedToJson = jsonDecode(otpResponse.body);
      sharedPreferences.setString(
          'access_token', convertedToJson['access_token']);
      return OtpResponse.fromJson(convertedToJson);
    } else {
      print('code error..');
      var convertedToJson = jsonDecode(otpResponse.body);
      return OtpResponse.fromJson(convertedToJson);
    }
  }

  Future<RecentTransactions> userRecentTransactions() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    late String? bearerToken = sharedPreferences.getString("access_token");
    print(bearerToken);
    final response = await http.get(
      Uri.parse(AppUrl.recentTransactionsURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $bearerToken',
      },
    );

    if (response.statusCode == 200) {
      var convertedToJson = jsonDecode(response.body);
      return RecentTransactions.fromJson(convertedToJson);
    } else {
      print('code error..');
      var convertedToJson = jsonDecode(response.body);
      return RecentTransactions.fromJson(convertedToJson);
    }
  }

  Future<SwipeResponse> swipeCardsBalance() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    late String? bearerToken = sharedPreferences.getString("access_token");
    print(bearerToken);
    final response = await http.get(
      Uri.parse(AppUrl.swipeCardsURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $bearerToken',
      },
    );

    if (response.statusCode == 200) {
      var convertedToJson = jsonDecode(response.body);
      return SwipeResponse.fromJson(convertedToJson);
    } else {
      print('code error..');
      var convertedToJson = jsonDecode(response.body);
      return SwipeResponse.fromJson(convertedToJson);
    }
  }
}
