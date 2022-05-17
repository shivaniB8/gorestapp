import 'package:flutter/material.dart';

import 'package:gorestapp/page/user_service.dart';
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
            return ListTile(
              title: Text(user.name ?? ""),
              subtitle: Text(user.email ?? ""),
              leading: CircleAvatar(child: Text('A')),
              trailing: Icon(Icons.favorite_border),
            );
          },
        ),
      ),
    );
  }
}
