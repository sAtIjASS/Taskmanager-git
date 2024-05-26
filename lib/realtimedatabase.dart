//How to fetch the data from realtime database in flutter in firebase
import 'dart:async';
import'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:get/get.dart';

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

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  TextEditingController postcontroller1=TextEditingController();
  TextEditingController postcontroller2=TextEditingController();
  TextEditingController postcontroller3=TextEditingController();
  TextEditingController postcontroller4=TextEditingController();
  final loading=false;

  Query ref=FirebaseDatabase.instance.ref().child('post');
  /* final data=FirebaseFirestore.instance.collection('post').doc('post').set(
       {

       });*/  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Fields with SizedBox'),
        ),
        body: Column(
          children: [

            FirebaseAnimatedList(query: ref, itemBuilder: ( context, snapshot,animation,index){
             if(snapshot.value!=null)
               {
                 Map<dynamic,dynamic> map=snapshot.data!.snapshot.value as dynamic;
                 List<dynamic>list=[];
                 list.clear();
                 list=map.values.toList();
               }
              return ListTile(
              title:Text(snapshot.child('1').child('title').value.toString()),
              subtitle:Text(snapshot.child('1').child('id').value.toString()),
            );

                        }),
          ]
        ),
        ),
      );
  }
}
