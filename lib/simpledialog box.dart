import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

RxString email = ''.obs;
RxString name = ''.obs;
RxString setfirst=''.obs;
  Future<dynamic> setProfile(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Set Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {

                 String emailset=nameController.text.toString();
                email.value=emailController.text.toString();
                name.value=nameController.text.toString();
                setfirst.value=emailset[0];

                setvaluepermanent()async  {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('email', '$email');
                  prefs.setString('name', '$name');
                  prefs.setString('setfirst', '$setfirst');
                  email.value =await prefs.getString('email')!;
                  name.value =await prefs.getString('name')!;
                  setfirst.value =await prefs.getString('setfirst')!;
                }
                setvaluepermanent();
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }


