import 'package:flutter/material.dart';
import 'package:gorestapp/page/post_user.dart';
import 'package:gorestapp/services/user_service.dart';

class AddUserPage extends StatefulWidget {
  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _gender = ['Male', 'Female'];
  final _status = ['Active', 'Inactive'];
  String? _statusValue;
  String? _genderValue;
  late Post _post;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: '$item',
        child: Text(
          '$item',
          style: const TextStyle(fontSize: 15),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New User'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter name'),
                controller: nameController,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter email'),
                controller: emailController,
              ),
              SizedBox(height: 16),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text('Select Your Gender'),
                      value: _genderValue,
                      isExpanded: true,
                      items: _gender.map(buildMenuItem).toList(),
                      onChanged: (value) =>
                          setState(() => this._genderValue = value),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text('Select your Status'),
                      value: _statusValue,
                      isExpanded: true,
                      items: _status.map(buildMenuItem).toList(),
                      onChanged: (value) =>
                          setState(() => this._statusValue = value),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
                child: SizedBox(
                  width: 200.0,
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: () async {
                        String name = nameController.text;
                        String email = emailController.text;
                        String gender = _genderValue.toString();
                        String status = _statusValue.toString();
                        Post? data =
                            await submitData(name, email, gender, status);
                        setState(() {
                          _post = data!;
                        });
                      },
                      child: Text(
                        'Submit',
                        style: const TextStyle(fontSize: 18),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
