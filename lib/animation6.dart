import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSizeWidget(),
    );
  }
}

class AnimatedSizeWidget extends StatefulWidget {
  @override
  State<AnimatedSizeWidget> createState() => AnimatedSizeWidgetState();
}

class AnimatedSizeWidgetState extends State<AnimatedSizeWidget> {
  bool _isExpanded = false;

  void _toggleSize() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Size Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: _isExpanded ? 200.0 : 100.0,
              height: _isExpanded ? 200.0 : 100.0,
              color: Colors.blue,
              child: FlutterLogo(size: 50),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleSize,
              child: Text(_isExpanded ? 'Shrink' : 'Expand'),
            ),
          ],
        ),
      ),
    );
  }
}
