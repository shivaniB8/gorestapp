import 'package:flutter/material.dart';
import 'package:gorestapp/extension/string_extensions.dart';
import 'package:gorestapp/screens/add.dart';
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
            String? gender = user.gender;
            String? email = user.email;
            String? status = user.status;
            String? genderAndStatus = (email ?? '') +
                "\n" +
                "Gender: " +
                (gender ?? '') +
                "       " +
                "Status: " +
                (status ?? '');

            return ListTile(
              title: Text(user.name ?? ""),
              subtitle: Text(genderAndStatus as String),
              leading:
                  CircleAvatar(child: Text(user.name?.getInitials() ?? '')),
              trailing: Icon(Icons.favorite_border),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
