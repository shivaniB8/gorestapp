import 'package:flutter/material.dart';

import 'package:gorestapp/services/user_service.dart';
import 'package:gorestapp/page/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> _usersList = [];

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  void _getUsers() async {
    _usersList = await getUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.blueGrey,
          ),
          itemCount: _usersList.length,
          itemBuilder: (BuildContext context, int index) {
            var user = _usersList[index];
            var gender = user.gender;
            var email = user.email;
            var status = user.status;
            var comb = email! + "\n" + "Gender: " +gender! + "       " + "Status: " +status!;
            String x = user.name ?? "";
            x.toString();
            var nameparts = x.split(" ");
            String initial1 = nameparts[0][0];
            String initial2 = nameparts[1][0];
            String initials = initial1+initial2;

            return ListTile(
              title: Text(user.name ?? ""),

              subtitle: Text(comb),

              leading: CircleAvatar(child: Text(initials)),
              trailing: Icon(Icons.favorite_border),
            );
          },
        ),
      ),
    );
  }
}
