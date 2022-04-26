import 'package:flutter/material.dart';

import '../services/user_services.dart';

class Constants {
  static const String Subscribe = 'Subscribe';
  static const String Settings = 'Settings';
  static const String SignOut = 'Sign out';

  static const List<String> choices = <String>[Subscribe, Settings, SignOut];
}

String _age(Map<dynamic, dynamic> user) {
  return "Age-" + user['dob']['age'].toString();
}

String _gender(Map<dynamic, dynamic> user) {
  return "Gender-" + user['gender'];
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List users = [];

  @override
  void initState() {
    super.initState();
    getUsersList();
  }

  getUsersList() async {
    var _usersFromAPI = await getUsers();
    setState(() {
      users = _usersFromAPI;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.blueGrey,
          ),
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            var user = users[index];
            return ListTile(
              title: Text(user['name']['first'] + ' ' + user['name']['last']),
              subtitle: Text(user['email'] +
                  '\n' +
                  _gender(users[index]) +
                  '     ' +
                  _age(users[index])),
              isThreeLine: true,
              leading: CircleAvatar(child: Text('A')),
              trailing: Icon(Icons.more_vert_sharp),
            );
          },
        ),
      ),
    );
  }
}

void choiceAction(String choice) {
  if (choice == Constants.Settings) {
    print('Settings');
  } else if (choice == Constants.Subscribe) {
    print('Subscribe');
  } else if (choice == Constants.SignOut) {
    print('SignOut');
  }
}
