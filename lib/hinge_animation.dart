import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green, // Set the app's primary theme color
      ),
      debugShowCheckedModeBanner: false,
      home: AlignAnimationExample(),
    );
  }
}

class AlignAnimationExample extends StatefulWidget {
  @override
  _AlignAnimationExampleState createState() => _AlignAnimationExampleState();
}

class _AlignAnimationExampleState extends State<AlignAnimationExample> {
  bool _isAlignedRight = false;

  void _toggleAlignment() {
    setState(() {
      _isAlignedRight = !_isAlignedRight; // Toggle the alignment state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedAlign Demo'), // App bar title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedAlign(
              duration: Duration(seconds: 1), // Animation duration
              alignment: _isAlignedRight
                  ? Alignment.centerRight
                  : Alignment.centerLeft, // Toggle alignment
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green, // Background color of the container
                child: Center(
                  child: Text(
                    'Hello',
                    style: TextStyle(color: Colors.white), // Text color
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Empty space between elements
            ElevatedButton(
              onPressed: _toggleAlignment, // Button click handler
              child: Text(_isAlignedRight
                  ? 'Align Left'
                  : 'Align Right'), // Button text
            ),
          ],
        ),
      ),
    );
  }
}
