import'package:flutter/material.dart';
import'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
void main()
{
  runApp(animation());
}
class animation extends StatefulWidget{
State<animation> createState() => anState();
}
class anState extends State<animation> with SingleTickerProviderStateMixin
{
  RxDouble firstvalue=0.0.obs;
  late Animation animation;
  late AnimationController animationcontroller;
  void initState()
  {
    animationcontroller=AnimationController(vsync: this,duration: Duration(seconds: 10));
    animation =Tween(begin: firstvalue.value,end: 100.0).animate(animationcontroller);
    animationcontroller.addListener(() {
    firstvalue.value=animation.value;
    });
    super.initState;
  }
  @override
  Widget build(BuildContext context)
  {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                    ()=> Container(
                  color: Colors.yellow,
                  child: Text("Animation"),
                  height:firstvalue.value ,
                  width: firstvalue.value,
                ),
              ),
              ElevatedButton(onPressed: (){
                animationcontroller.forward();
              }, child: Text("Press"))
            ],
          ),
        )
      ),
    );
  }
}