import'package:flutter/material.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        home: Scaffold(
          body: Container(),
        )
    );
  }
}
