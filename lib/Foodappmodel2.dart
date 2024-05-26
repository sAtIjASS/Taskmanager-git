import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sf_p/url%20launcher.dart';
import 'dart:io';
import 'Food app 1.dart';
import 'Foodappmodel.dart';
import 'Foodappmodel1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAcPRw8FyfdFyH1I8A7FXc0-126jhmEQXs',
          appId: '1:766401696299:android:26381addd144730eea906e',
          messagingSenderId: '766401696299',
          projectId: 'firstproject-bfc78'))
      : await Firebase.initializeApp();
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: AuthScreenlogout()));
}

class AuthScreenlogout extends StatefulWidget {
  @override
  State<AuthScreenlogout> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreenlogout>
    with SingleTickerProviderStateMixin {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 800,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
"https://i.postimg.cc/T1Frjp2G/h-Sm4-Tcbd-RV-Kh0-PFOUF5fg.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.lock, color: Colors.greenAccent),
                ),
                obscureText: true,
              ),
              SizedBox(height: 40),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.email, color: Colors.greenAccent),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _login();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black12,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 16, color: Colors.greenAccent),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    try {

      final userCredential = FirebaseAuth.instance;
      await userCredential.signOut();
      call() async
      {
        Future.delayed(Duration(seconds: 5));
        await  Navigator.push(
            context, MaterialPageRoute(builder: (context) => AuthScreen()));
        print('Email: ${_emailController.text}');
        print('Password: ${_passwordController.text}');

      }
      call();
    } catch (e) {
      print('Failed to logout: $e');
      Get.snackbar('Failed to logout', '${e.toString()}');
    }
  }
}
