import 'dart:io';
import'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
void main()async
{

  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyAcPRw8FyfdFyH1I8A7FXc0-126jhmEQXs',
          appId: '1:766401696299:android:26381addd144730eea906e',
          messagingSenderId: '766401696299',
          projectId: 'firstproject-bfc78'))
      : await Firebase.initializeApp();

  runApp(GetMaterialApp(home: satija()));
}class satija extends StatefulWidget{
  State<satija> createState() =>satijas();
}
class satijas extends State<satija>
{
  var name;
  TextEditingController updatevalue=TextEditingController();
  final databases=FirebaseDatabase.instance.ref("post");
  Widget build(BuildContext context)
 {
   return Scaffold(
     body: Column(
       children: [
         Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               SizedBox(  height: 200,),


               Container(
                 width: 500,
                 height: 200,
                 child: FirebaseAnimatedList(query: databases, itemBuilder: (context,snapshot, animation , index){
                   return Card(

                     child: ListTile(
                       title: Text(snapshot.child('id').value.toString()),
                       trailing:                ElevatedButton(onPressed: (){
                         showdialog(snapshot);
                       }, child: Text("Pressed")),

                     ),
                   );

                 }),
               ),
             ],
           ),
         )
       ],
     ),
   );
 }
 final Database=FirebaseDatabase.instance.ref("post");
  final Databasevalue=FirebaseDatabase.instance.ref("satija");
 Future <void> showdialog(var snapshot)async{
   return showDialog(
       context: context,builder:(context){
       return AlertDialog(
         title: Text("Enter value "),
         content: TextField(
           controller: updatevalue,
         ),
           actions: [
             ElevatedButton(onPressed: (){
               Database.update({
                 'name': updatevalue.text.toString(),
               }).then((value) => print("data updated")).onError((error, stackTrace) => print("Error Occured"));
             },child: Text("Update"),)
             ,ElevatedButton(onPressed: (){
               databases.child(snapshot.child('id').value.toString()).remove().then((value) => Get.snackbar("Data","Successfully Deleted"));
             }, child: Text("Presed"))
         ],
       );
   }
   );
 }
}