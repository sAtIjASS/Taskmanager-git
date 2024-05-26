import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAcPRw8FyfdFyH1I8A7FXc0-126jhmEQXs',
          appId: '1:766401696299:android:26381addd144730eea906e',
          messagingSenderId: '766401696299',
          projectId: 'firstproject-bfc78'))
      : await Firebase.initializeApp();
}
class FirebaseApi{
  final firebaseMessaging = FirebaseMessaging.instance;
  Future<void> init() async {
    await firebaseMessaging.requestPermission();
    final token = await firebaseMessaging.getToken();
    print('Token: $token');

  }
}