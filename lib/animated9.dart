import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated Alignment Container'),
        ),
        body: Center(
          child: MyAnimatedAlignContainer(),
        ),
      ),
    );
  }
}

class MyAnimatedAlignContainer extends StatefulWidget {
  @override
  _MyAnimatedAlignContainerState createState() => _MyAnimatedAlignContainerState();
}

class _MyAnimatedAlignContainerState extends State<MyAnimatedAlignContainer> {
  bool _isAlignedRight = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedAlign(
          duration: Duration(seconds: 1),
          alignment: _isAlignedRight ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.deepPurple,
          ),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isAlignedRight = !_isAlignedRight;
            });
          },
          child: Text("Toggle Alignment"),
        ),
      ],
    );
  }
}
