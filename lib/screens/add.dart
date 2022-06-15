import 'dart:ui';

import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late final gender = ['Male', 'Female', 'Other'];
  late final status = ['Active', 'Inactive'];
  String? statusValue;
  String? genderValue;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate() {
    if (formkey.currentState!.validate()) {
      print("Validated");
    } else {
      print("Not Validated");
    }
  }

  String? validatepass(value) {
    if (value.isEmpty) {
      return "required";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Add New User"),
          backgroundColor: Colors.green,
        ),
        body:
        Padding(
          padding: EdgeInsets.all(25.0),
          child: Center(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('User Form', style: const TextStyle(fontWeight: FontWeight.w200, fontSize: 35, color: Colors.green),),
                  SizedBox(height:16),

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

                      validator: validatepass),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                    ),
                    child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          labelText: "Email",
                          prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.email,
                            ),
                          ),
                        ),
                        validator: validatepass),
                  ),
                  Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      width: 1000,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                      ),

                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(

                          hint: Text('Select Your Gender'),
                          value: genderValue,
                          isExpanded: true,
                          items: gender.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => this.genderValue = value),
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
                      width: 1000,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: Text('Select your Status'),
                          value: statusValue,
                          isExpanded: true,
                          items: status.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => this.statusValue = value),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: new SizedBox(
                      width: 200.0,
                      height: 50.0,
                    child: ElevatedButton(

                      onPressed: validate,
                      child: Text("Submit",  style: const TextStyle(fontSize: 18),
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
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: '$item',
        child: Text(
          '$item',
          style: const TextStyle(fontSize: 15),
        ),
      );
}
