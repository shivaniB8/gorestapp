import 'dart:convert';
import 'package:http/http.dart' as http;

getUsers() async {
  try {
    var response =
    await http.get(Uri.parse('https://randomuser.me/api/?results=20'));
    var body = jsonDecode(response.body);
    return body['results'];
  } catch (err) {
    print(err.toString());
  }
}


