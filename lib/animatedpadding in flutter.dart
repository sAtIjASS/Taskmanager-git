import'package:flutter/material.dart';
import 'package:get/get.dart';
void main(){
  runApp(MY());
}
RxDouble setpadding=0.0.obs;
class MY extends StatefulWidget{
  @override
  State<MY> createState() => _MYState();
}

class _MYState extends State<MY> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body:Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: Padding(
            padding: EdgeInsets.all(setpadding.value),
            child: Text("Priyanshu satija",style: TextStyle(color: Colors.white),),
          ),
        ) ,
      ),
    );
  }
}