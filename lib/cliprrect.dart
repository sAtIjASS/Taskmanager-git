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
  var arrlist = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

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
        body: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.elliptical(200, 159)),
            child: Container(color: Colors.grey,
              width: 200,

              height: 200,
              child: Image.asset("assets/images/name.jpg",  fit:BoxFit.fill, ),
            ),
          ),
        )
    );
  }
}