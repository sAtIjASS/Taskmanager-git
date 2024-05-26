import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
var hello=DateTime.now();
class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build (BuildContext context){

    return MaterialApp(

        home: Scaffold(
            body: Center(
                child:
                ElevatedButton(onPressed: (){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(title: Text("${hello.microsecond}"),);
                  });
                },child: Text("Press"),)
            )
        )
    );
  }
}