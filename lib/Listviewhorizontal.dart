//LIST VIEW HORIZONTAL IN FLUTTER
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
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: 400,
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue, // Added color to the second Container for demonstration
                  ),


                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.greenAccent, // Added color to the second Container for demonstration
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow, // Added color to the second Container for demonstration
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey, // Added color to the second Container for demonstration
                  ),
                ], // Added closing bracket for ListView children
              ),
            ),
          ), // Added closing bracket for ListView
        ), // Added closing bracket for Center
      ), // Added closing bracket for Scaffold
    ); // Added closing bracket for GetMaterialApp
  }
}
