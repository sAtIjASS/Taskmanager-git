import'package:flutter/material.dart';
import'package:get/get.dart';
void main(){
  runApp(setanimation());
}
class setanimation extends StatefulWidget{
  @override
  State<setanimation> createState() => setanimationState();
}
class setanimationState extends State<setanimation> with SingleTickerProviderStateMixin
{
  late Animation animation;
  late AnimationController animationcontroller;
  void initState()
  {
    animationcontroller=AnimationController(vsync: this ,duration: Duration(seconds: 10));
    animation=Tween(begin: 0.0,end: 100.0).animate(animationcontroller);
    animationcontroller.addListener(() {
      setState(() {

      });
    });
    animationcontroller.forward();
    super.initState;

  }
  @override
  Widget build(BuildContext context)
  {
    return GetMaterialApp(
      home: Scaffold(
        body:Center(
          child: Container(
            width: animation.value,
            height: animation.value,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}