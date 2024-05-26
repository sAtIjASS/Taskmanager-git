import'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../data/app_exception.dart';

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget  build(BuildContext context)
  {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          throw Internetexception("message");
        },
        child: Icon(Icons.add),
      ),
      body: Center(child: Text("Priyanshu satija"),),
    );
  }
}