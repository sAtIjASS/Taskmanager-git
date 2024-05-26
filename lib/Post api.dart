import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: "Email",
            ),
            controller: _emailController,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.password),
              hintText: "Password",
            ),
            controller: passwordController,
          ),
          SizedBox(
            height: 20,
          )
              ,
              ElevatedButton(onPressed: (){
                   login(email: _emailController.text.toString(), password: passwordController.text.toString());
              },
                  child:Text("Sign Up")
              ),
        ])),
      ),
    );
  }

  void login ({required String email, required String password})  async{
    try{
      final  response= await http.post(Uri.parse('https://reqres.in/api/register'),
      body: {
        "email":email,
        "password":password
      });
      if(response.statusCode==200){
        Fluttertoast.showToast(msg: "Successfully Login");
        var data=jsonDecode(response.body.toString());
       Get.snackbar(data['id'].toString(), data['token'].toString());
      }
      else
        {
          print("Error Occur ");
        }
    }catch(e){
      print("${e.toString()}");
      Fluttertoast.showToast(msg: "Error Occur");
    }
  }
}
