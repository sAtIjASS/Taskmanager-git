//Tween Animation in flutter
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  late Animation animation;
  late AnimationController animationcontroller;
  late Animation coloranimation;
  void initState() {
    animationcontroller=AnimationController(vsync: this,duration: Duration(seconds: 3));
    animation=Tween(begin: 0.0,end: 100.0).animate(animationcontroller);
    coloranimation=ColorTween(begin:Colors.blue,end: Colors.orange).animate(animationcontroller);

    animationcontroller.addListener(() {
     setState(() {

     });
    });
    animationcontroller.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            height: 50.0,
            width: animation.value,
            color: coloranimation.value,
          )
        ),
      ),
    );
  }
}