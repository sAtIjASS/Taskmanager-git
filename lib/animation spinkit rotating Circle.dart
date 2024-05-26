import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

void main() {
  runApp(spin());
}

class spin extends StatefulWidget {
  @override
  State<spin> createState() => spinState();
}

class spinState extends State<spin> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          size: 50,
          duration:  const Duration(milliseconds: 100),
          itemBuilder: (context, index) {
            return DecoratedBox(
                decoration: BoxDecoration(
                    color: index.isEven ? Colors.red : Colors.blue,
                    shape: BoxShape.circle));
          },
        ),
      ),
    ));
  }
}
