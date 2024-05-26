import'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(setanimation());
}
class setanimation extends StatefulWidget{
  @override
  State<setanimation> createState() => setanimationState();
}
class setanimationState extends State<setanimation> with SingleTickerProviderStateMixin
{
//  late Animation _animation;
  late AnimationController _animationcontroller;
  void initState()
  {
    _animationcontroller=AnimationController(vsync: this,duration: Duration(seconds: 10));
  //  _animation=Tween(begin:0.0,end:1.0).animate(_animationcontroller);
    _animationcontroller.addListener(() {
      setState(() {

      });
    });
    _animationcontroller.forward();
  }
  List radi=[150.0,200.0,250.0,300.0,350.0];

  @override
  Widget build(BuildContext context)
  {
    return GetMaterialApp(
      home: Scaffold(
          body:Center(
            child: Stack(
              alignment: Alignment.center,
              children:  radi.map((e) => Container(
                width: e*_animationcontroller.value,
                height: e*_animationcontroller.value,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.withOpacity(1.0- _animationcontroller.value)
                ),
              )).toList(),

            ),
          )
      ),
    );
  }
}