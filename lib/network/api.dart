import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Future loginUser(
      String email, String password, String version, int os) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(
      Uri.parse('https://fenix-auth.mercurydev.tk/login'),
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
      print(convertedToJson);
      sharedPreferences.setString(
          'answer_token', convertedToJson['answer_token']);
    } else {
      print('code error..');
      var convertedToJson = jsonDecode(response.body);
      print(convertedToJson);
    }
    var convertedToJsonReturn = jsonDecode(response.body);
    return convertedToJsonReturn;
  }
}
