import 'dart:convert';
import 'package:gorestapp/page/user.dart';
import 'package:http/http.dart' as http;

Future<List<User>> getUsers() async {
  var response =
      await http.get(Uri.parse('https://gorest.co.in/public/v2/users'));
  var json = jsonDecode(response.body);
  return json.map<User>((user) => User.fromJson(user)).toList();
}
