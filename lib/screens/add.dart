import 'dart:ui';
import 'package:flutter/material.dart';

class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _gender = ['Male', 'Female', 'Other'];
  final _status = ['Active', 'Inactive'];
  String? _statusValue;
  String? _genderValue;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate() {
    if (formkey.currentState!.validate()) {
      print("Validated");
    } else {
      print("Not Validated");
    }
  }


  String? isRequiredValidator(value) {
    if (value.isEmpty) {
      return "required";
    } else {
      return null;
    }
  }

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
        title: Text("Add New User"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'User Form',
                  style: const TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 35,
                      color: Colors.green),
                ),
                SizedBox(height: 16),
                TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name",
                      prefixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                    validator: isRequiredValidator,
                ),
                SizedBox(height:16),
                TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      prefixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                    validator: isRequiredValidator,
                ),
                SizedBox(height:16),
                Center(
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                    padding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                  child:SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: validate,
                      child: Text(
                        "Submit",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
