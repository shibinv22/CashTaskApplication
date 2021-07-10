import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future loginUser(
      String email, String password, String version, int os) async {
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
    } else {
      print('code error..');
      var convertedToJson = jsonDecode(response.body);
      print(convertedToJson);
    }
    var convertedToJsonReturn = jsonDecode(response.body);
    return convertedToJsonReturn;
  }
}




// var headers = {
//   "Content-Type": "application/json",
//   "Content-Length": "",
//   "Host": "<calculated when request is sent>",
// };
// final msg = {
//   'email': "email",
//   'password': "password",
// };

// Future loginUser(String email, String password) async {
//   String url = 'https://fenix-auth.mercurydev.tk/login';
//   final response = await http.post(
//     Uri.parse(url),
//     headers: headers,
//     body: jsonEncode(msg),
//   );
//   var convertedToJson = jsonDecode(response.body);
//   print(convertedToJson);
//   return convertedToJson;
// }
