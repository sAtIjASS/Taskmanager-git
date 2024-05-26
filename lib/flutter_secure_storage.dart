import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX Example with Empty Body'),

        ),
        body:Center(child: ElevatedButton(onPressed: functions, child: Text("Press"))), // Empty body
      ),
    );
  }


  void functions() async{
    final storage =const FlutterSecureStorage();
    storage.write(key:'satija', value: 'Priyanshu');
    storage.write(key: 'satija1',  value: 'satija');
    storage.write(key: 'satija2', value: 'Mokesh');
    storage.write(key: 'satija3', value: 'Rahul');
    storage.write(key: 'satija4', value: 'Dikshant');
   List store=[];
    store.add(storage.readAll().then((value) => print(value.values)));
    store.forEach((element) {print("${element.value}"); });
  }
}
