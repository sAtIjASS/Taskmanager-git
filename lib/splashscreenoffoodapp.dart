import 'dart:async';
import 'package:flutter/material.dart';
import'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:animator/animator.dart';
import 'Foodappmodel.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
  ? await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAcPRw8FyfdFyH1I8A7FXc0-126jhmEQXs',
          appId: '1:766401696299:android:26381addd144730eea906e',
          messagingSenderId: '766401696299',
          projectId: 'firstproject-bfc78'))
  : await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,home: SplashScreen()));
}

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 12), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => AuthScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Animator<double>(
          duration: Duration(milliseconds: 1500),
          cycles: 0,
          curve: Curves.easeInOut,
          tween: Tween<double>(begin: 0.0, end: 15.0),
          builder: (context, animatorState, child) => Container(
            margin: EdgeInsets.all(animatorState.value),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFF5757),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFFF5757).withOpacity(0.5),
                  offset: Offset(0, 5),
                  blurRadius: 30,
                ),
              ],
            ),
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.postimg.cc/XNzHHvJT/K2fq3-Nr-ZTb-m-JFJ04-UWla-Q-1.png"
                  )
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}


