import 'dart:convert';
import 'package:gorestapp/page/post_user.dart';
import 'package:gorestapp/page/user.dart';
import 'package:http/http.dart' as http;

Future<List<User>> getUsers() async {
  var response =
      await http.get(Uri.parse('https://gorest.co.in/public/v2/users'));
  var json = jsonDecode(response.body);
  return json.map<User>((user) => User.fromJson(user)).toList();
}

Future<Post?> submitData(
    String name, String email, String gender, String status) async {
  var response = await http.post(
      Uri.parse('https://gorest.co.in/public/v2/users'),
      headers: {'Authorization':'Bearer eddd3b2a93a235976eabb880d1c14ca131c4c3ff32805777a61ecfc8c6c1bc3f'},
      body: {'name': name, 'email': email, 'gender': gender, 'status': status,});
  var data = response.body;
  print(data);
  if (response.statusCode == 201) {
    String responseString = response.body;
    postFromJson(responseString);
  } else
    return null;
}
