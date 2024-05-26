
import'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'data/app_exception.dart';
void main()
{
  runApp(GetMaterialApp(home:MyApp()));
}
class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget  build(BuildContext context)
  {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            Fluttertoast.showToast(msg: "Priyanshu Satija", gravity: ToastGravity.BOTTOM);
          },child: Text("Pressed"),)
        ],
      ),
    );
  }
}