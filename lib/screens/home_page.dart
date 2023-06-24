import 'package:flutter/material.dart';
import 'package:gorestapp/extension/string_extensions.dart';
import 'package:gorestapp/page/skeleton.dart';
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
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    super.initState();
    _getUsers();
  }

  void _getUsers() async {
    _usersList = await getUsers();
    setState(() {});
    _isLoading=false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Container(
        child: _isLoading
            ? ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.blueGrey[200],
          ),
          itemCount: 10,
          itemBuilder: (context, index) => const NewsCardSkelton(),
        )
            : ListView.separated(
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
            MaterialPageRoute(builder: (context) => AddUserPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Skeleton(height: 60, width: 60),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skeleton(width: 200),
              const SizedBox(height: 4),
              const Skeleton(),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Expanded(
                    child: Skeleton(),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Skeleton(),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}



