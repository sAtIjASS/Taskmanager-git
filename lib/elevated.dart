import'package:flutter/material.dart';
import'package:get/get.dart';
import'Foodappbackend.dart';
import 'Foodapp1.dart';
void main()
{
  runApp(MyAppss());
}
class MyAppss extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(onPressed: (){
            Get.to(MyApp());
          }, child: Text('Click me')),
        ),
      ),
    );
  }
}