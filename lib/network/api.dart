import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:untitled1/model/login_model.dart';

// Future loginUser(String email, String password) async {
//   String url = 'https://fenix-auth.mercurydev.tk/login';
//   final response = await http.post(Uri.parse(url), body: {
//     'email': email,
//     'password': password,
//   });

class ApiService {
  Future<LoginResponseModel> loginUser(LoginRequestModel requestModel) async {
    String url = 'https://fenix-auth.mercurydev.tk/login';

    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Failed to load data');
    }
  }
}
