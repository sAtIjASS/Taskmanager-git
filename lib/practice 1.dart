import'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RadioListTile(value: 1, groupValue: Text("Priyanshu satija"), onChanged:(value){
                setState(() {
                  value=value!;
                });
              }, title: Text("Priyanshu satija"),subtitle: Text("Very good"),),
            ],
          ),
        ),
      ),
    );
  }
}