import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(
    GetMaterialApp(home:satija()));
  return;
}
class satija extends StatefulWidget{
  @override
  State<satija> createState() => _mmmmState();
}

class _mmmmState extends State<satija> {
  @override
  Widget build(BuildContext context){
    return  Scaffold(
        body: Center(
          child: ExpansionTile(
            title: Text("hello"),
            subtitle: Text(" Priyanshu satija"),
            children: [
              Text("hello"),
               Container(
                 width: double.infinity,
                 height: 200,
                 child: Align(
                   child:   Image.asset("assets/images/name.jpg"),
                 ),
               )
            ],
          ),
        ),
      );
  }
}