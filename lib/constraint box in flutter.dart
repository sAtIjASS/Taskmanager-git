import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

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
          title: Text('Empty Body'),
        ),
        body: ConstrainedBox(
            constraints:BoxConstraints(
              maxWidth: 200,
              maxHeight: 200,
              minWidth: 100,
              minHeight: 100
            ),
            child: Text("Priyanshu satija , Priyanshu satija  ,Priyanshu satija  ,Priyanshu satija  ,Priyanshu satija , Priyanshu satija ,Priyanshu satija ",style: TextStyle(fontSize: 30,overflow: TextOverflow.fade),)), // Empty container
      ),
    );
  }
}
