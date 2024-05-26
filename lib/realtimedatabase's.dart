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

  runApp(GetMaterialApp(home: MyApp()));
    return ;
  }
  class MyApp extends StatefulWidget
  {

    @override
    State<MyApp> createState() => _MyAppState();
  }

  TextEditingController setvalue=TextEditingController();
  TextEditingController updatevalue=TextEditingController();
  class _MyAppState extends State<MyApp> {
    final database=FirebaseDatabase.instance.ref('post');
    var databases=FirebaseDatabase.instance.ref('satija');
    @override
    Widget build(BuildContext context)
    {
      return  Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    TextField(
                      controller:setvalue,
                           decoration: InputDecoration(
                 labelText: "Enter value to Database",
                 suffixIcon: Icon(Icons.text_fields),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(20),
                    gapPadding: 10,
                   borderSide: BorderSide(color:Colors.blue),
                 )
                           ),
                    ),
                    SizedBox(height: 30,),
                    ElevatedButton(onPressed: (){
  try{
    database.set({
      "name":setvalue.text.toString(),
    }).then((value) => print('Data inserted successfully'));
   call();
  }catch(e){
    print(e.toString());
  }
                    },  child: Text("Press")),

                    SizedBox(height: 50,),

                  Container(
                    width: 100,
                    height: 100,
                    child:ElevatedButton(
                      onPressed: (){
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            actions: [
                              Column(
                                children: [

                                  TextField(
                                    controller: updatevalue,
                                  ),
                                  ElevatedButton(onPressed: (){
                                    database.update({
                                      'name':updatevalue.text.toString(),
                                    });
                                    call();
                                    Navigator.pop(context);
                                  }, child: Text("Pressed")),

                                ],
                              ),

                            ],
                          );
                        });
                      },child: Text("Press")),
                    )                  ,
                  Container(
                    width: 500,
                    height: 200,
                    child: FirebaseAnimatedList(query: database, itemBuilder: (context,snapshot, animation , index){
                      return Card(
                        child: ListTile(
                          title: Text(snapshot.child('name').value.toString()),
                          subtitle: Text(snapshot.child('class').value.toString()),
                        ),
                      );
                    }),
                  ),

                  ],
                ),
              ),
            ),
          ),
        );
    }
    void call()
    {
      Get.snackbar("Data", "Successfully Inserted ");
    }
  }