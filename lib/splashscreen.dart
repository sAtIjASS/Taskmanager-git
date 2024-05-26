import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Get.to(Gra());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 500,
              height: 667,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xfffbc2eb),
                    Color(0xfffccb90x)
                   ]
                  ,begin: FractionalOffset(0.0,0.0),
                  end: FractionalOffset(2.5,1.0),
                  stops: [0.3,0.2],
                )

              ),

                     child:  Center(
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(10),
                         child: RichText(
                           text: TextSpan(
                             children: [
                               TextSpan(text: "Talk", style: TextStyle(color: Colors.black, fontSize: 28)),
                               TextSpan(text: "Hub", style: TextStyle(color: Colors.brown, fontSize: 40))
                             ],
                           ),
                         ),
                       ),
                     ),
            ),
          ),

        ],
      ),
    );
  }
}

class Gra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Text(
          'Second Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
