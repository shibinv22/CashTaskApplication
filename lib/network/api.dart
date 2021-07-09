import 'package:http/http.dart' as http;
import 'dart:convert';

var headers = {
  "Content-Type": "application/json",
  "Content-Length": "<calculated when request is sent>",
  "Host": "<calculated when request is sent>",
};
final msg = {
  'email': "email",
  'password': "password",
};

Future loginUser(String email, String password) async {
  String url = 'https://fenix-auth.mercurydev.tk/login';
  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(msg),
  );
  var convertedToJson = jsonDecode(response.body);
  print(convertedToJson);
  return convertedToJson;
}
