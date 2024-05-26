import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget { // Change to StatefulWidget
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { // State class for MyHomePage
  bool _isDragged = false; // Define state variable to track drag state
  var values=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: CurvedNavigationBar(
        color:  Colors.greenAccent,
          backgroundColor: Colors.yellow,
        items: [
          Icon(Icons.add),
          Icon(Icons.list),
          Icon(Icons.compare_arrows),
        ]
      ),/*
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add),label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.abc),label: "abc"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label: "ac_unit"),
        ],
      ),*/
      appBar: AppBar(
        title: Text('Empty Body'),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RadioListTile(value: 1, groupValue: values , onChanged:(value){
                    setState(() {
                      values=value!;
                    });
                  }, title: Text("Priyanshu satija"),subtitle: Text("Very good"),),



               RadioListTile(value: 2, groupValue: values, onChanged: (value){
                 setState(() {
                   values=value!;
                 });
               },subtitle: Text("Very Good"),title: Text("Priya Kumair"),)


                ],
              ),
            ),





            SizedBox(height: 30,),
            LongPressDraggable(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Drag me!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              feedback: Container(
                width: 100,
                height: 100,
                color: Colors.blue.withOpacity(0.5),
                child: Center(
                  child: Text(
                    'Dragging...',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onDragStarted: () {
                // Callback when the drag operation starts
                setState(() {
                  _isDragged = true; // Update the drag state
                });
              },
              onDragEnd: (details) {
                // Callback when the drag operation ends
                setState(() {
                  _isDragged = false; // Update the drag state
                });
              },
            ),
          ],
        ),
      ), // Empty body
    );
  }
}
