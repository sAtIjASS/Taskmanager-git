import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
  final fcmToken=await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Notifications Demo',
      home: PushNotificationScreen(),
    );
  }
}

class PushNotificationScreen extends StatefulWidget {
  @override
  _PushNotificationScreenState createState() => _PushNotificationScreenState();
}

class _PushNotificationScreenState extends State<PushNotificationScreen> {
 //final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    super.initState();
  //  _configureFirebaseListeners();
  }
/*
  void _configureFirebaseListeners() {
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        // Handle foreground notification
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // Handle notification when app is terminated
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // Handle notification when app is in background
      },
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notifications Demo'),
      ),
      body: Center(
        child: Text(
          'Push notifications will appear here',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
