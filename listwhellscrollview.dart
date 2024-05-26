import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Counter App',
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Counter App'),
      ),
      body:ListWheelScrollView(
        children: [
          Container(
            child: Text("Priyanshu satija 1"),
            height: 50,
            width: 50,

          ),
          Container(
            child: Text("Priyanshu satija 1"),
            height: 50,
            width: 50,

          ),
          Container(
            child: Text("Priyanshu satija 1"),
            height: 50,
            width: 50,

          ),
          Container(
            child: Text("Priyanshu satija 1"),
            height: 50,
            width: 50,

          ),
          Container(
            child: Text("Priyanshu satija 1"),
            height: 50,
            width: 50,

          ),Container(
            child: Text("Priyanshu satija 1"),
            height: 50,
            width: 50,

          ),Container(
            child: Text("Priyanshu satija 1"),
            height: 50,
            width: 50,

          ),Container(
            child: Text("Priyanshu satija 1"),
            height: 50,
            width: 50,

          ),Container(
            child: Text("Priyanshu satija 1"),
            height: 50,
            width: 50,

          ),
        ],
        itemExtent: 100,

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
