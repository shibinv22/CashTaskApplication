import 'package:http/http.dart' as http;
import 'dart:convert';

Future loginUser(String email,String password) async {
  String url ='https://fenix-auth.mercurydev.tk/login';
  final response = await http.post(url,
  headers: {"Accept" : "Application.json"},
  body: {'email':email,'password':password});
  var convertedDataToJson = jsonDecode(response.body);
  return convertedDataToJson;
}


