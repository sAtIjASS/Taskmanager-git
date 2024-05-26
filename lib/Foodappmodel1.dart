import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'Foodappmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

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
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreens()));
}

class AuthScreens extends StatefulWidget {
  @override
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();

  State<AuthScreens> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreens> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            height: 800,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://i.postimg.cc/VLz90Tbb/backgroundimage.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      labelText: 'Name',
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person, color: Colors.greenAccent),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: _phoneController,
                    decoration: InputDecoration(
                      hintText: 'Enter your phonenumber',
                      labelText: 'Phone Number',
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.phone, color: Colors.greenAccent),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: _addressController,
                    decoration: InputDecoration(
                      hintText: 'Enter your Address',
                      labelText: 'Address',
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.home, color: Colors.greenAccent),
                    ),
                  ),
              
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
                  ElevatedButton(
                    onPressed: () {
                      setvaluetofirebasebackend(_nameController.text, _phoneController.text, _addressController.text);
                      signin(_emailController.text, _passwordController.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreen()));// Navigate to SignUpScreen
              
                      print('Email: ${_emailController.text}');},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black38,
                      padding:
                      EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 16, color: Colors.greenAccent),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreen()));// Navigate to SignUpScreen
                      print('Navigate to signup screen');
                    },
                    child: Text(
                      'Have Account ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }

  void setvaluetofirebasebackend(String name, String phoneNumber, String address) {
    final database = FirebaseFirestore.instance;
    if(name.isNotEmpty && phoneNumber.isNotEmpty && address.isNotEmpty)
    {
      try {
        database
            .collection("$phoneNumber")
            .add({"name": name, "phoneNumber": phoneNumber, "address": address});
      } catch (e) {
        print(e);
      }
    }
  }


}

FirebaseAuth auth = FirebaseAuth.instance;

Future<void> signin(email, password) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    Get.snackbar('User Signed up', 'Email: ${userCredential.user!.email}');
    print('User Signed up: ${userCredential.user!.email}');
    Get.to(AuthScreen());
  } catch (e) {
    print('Failed to Sign up: $e');
    Get.snackbar('Failed to Sign up', '${e.toString()}');
  }

}
