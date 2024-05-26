import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sf_p/url%20launcher.dart';
import 'dart:io';
import 'Food app 1.dart';
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
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: AuthScreen()));
}

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
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
                "https://i.postimg.cc/Jn7qnswy/backgroundimage.jpg",
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
                  backgroundColor: Colors.black38,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 16, color: Colors.greenAccent),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AuthScreens()));
                  print('Navigate to signup screen');
                },
                child: Text(
                  'Don\'t have an account? Sign up',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Get.snackbar('User logged in', 'Email: ${userCredential.user!.email}');
       call() async
      {
        Future.delayed(Duration(seconds: 5));
        await  Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => app()));
        print('Email: ${_emailController.text}');
        print('Password: ${_passwordController.text}');

      }
      call();
      print('User logged in: ${userCredential.user!.email}');
    } catch (e) {
      print('Failed to login: $e');
      Get.snackbar('Failed to login', '${e.toString()}');
    }
  }
}
