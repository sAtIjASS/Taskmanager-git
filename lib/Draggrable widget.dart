import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Draggable Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DragAndDropPage(),
    );
  }
}

class DragAndDropPage extends StatelessWidget {
  // List of items for demonstration
  final List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Draggable Example'),
        ),
        body:Draggable(
          data: 'Item 1',
          feedback: Container(
            height: 100,
            width: 100,
            color: Colors.red,
            child: Text('Dragging Item 1'),

          ),
          child: Container(
            color: Colors.red,
            width: 100,
            height: 100,
          )
        )
    );
  }

}