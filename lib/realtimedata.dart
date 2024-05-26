import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'YOUR_API_KEY',
          appId: 'YOUR_APP_ID',
          messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
          projectId: 'YOUR_PROJECT_ID'))
      : await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  TextEditingController postcontroller1 = TextEditingController();
  TextEditingController postcontroller2 = TextEditingController();
  TextEditingController postcontroller3 = TextEditingController();
  TextEditingController postcontroller4 = TextEditingController();
  final loading = false;

  Query ref = FirebaseDatabase.instance.ref('8950363565');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('RESUME'),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: ref.once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Extract data from the snapshot
                    Map<dynamic, dynamic> resumeData = snapshot.data!.value;

                    // Create a list to store ListTile widgets
                    List<ListTile> resumeList = [];

                    // Iterate over the resume data and create ListTiles
                    resumeData.forEach((key, value) {
                      ListTile tile = ListTile(
                        title: Text(value['School']),
                        subtitle: Text(value['degree']),
                        leading: Text(value['extra']),
                      );
                      // Add the ListTile to the list
                      resumeList.add(tile);
                    });

                    // Return a ListView containing the ListTiles
                    return ListView(
                      children: resumeList,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
