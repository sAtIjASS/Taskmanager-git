import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyAcPRw8FyfdFyH1I8A7FXc0-126jhmEQXs',
          appId: '1:766401696299:android:26381addd144730eea906e',
          messagingSenderId: '766401696299',
          projectId: 'firstproject-bfc78'))
      : await Firebase.initializeApp();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Fields with SizedBox'),
        ),
        body: FirebaseDataList(),
      ),
    );
  }
}

class FirebaseDataList extends StatelessWidget {
final database=FirebaseDatabase.instance.ref('8950363565');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: database.onValue,
      builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
          return Center(child: Text('No data available'));
        }

        Map<dynamic, dynamic> data = snapshot.data!.snapshot.value as dynamic;
        List<dynamic> dataList = [];
        dataList.clear();
        dataList=data.values.toList();

        return ListView.builder(
          itemCount: snapshot.data!.snapshot.children.length,
          itemBuilder: (context, index) {
            // Assuming your data structure contains keys 'title' and 'id' under '1'
            return Column(
              children: [

              ],
            );
          },
        );
      },
    );
  }
}
