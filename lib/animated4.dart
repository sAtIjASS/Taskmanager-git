//animationcontainer, animationopacity , animationcrossfade in flutter animation
import'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  State<MyApp> createState() => MyAppState();
}
class MyAppState extends State<MyApp>{
  var w=100,h=200;
  RxDouble op=1.0.obs;
  bool setvalue=true;
  RxBool setss=true.obs;
  @override Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 3),
                  curve: Curves.bounceIn,
                  width: w.toDouble(),
                  height: h.toDouble(),
                  color: Colors.deepPurple,
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    if(setvalue)
                    {
                      w=200;
                      h=100;
                      setvalue=false;
                    }
                    else
                    {
                      w=100;
                      h=200;
                      setvalue=true;

                    }

                  });
                }, child: Text("Pressed"))



                ,
                InkWell(
                    onTap:setopacity ,
                    child: Obx(()=> AnimatedOpacity(opacity: op.toDouble(),duration: Duration(seconds: 3),child: Container(width:200, height:200,decoration: BoxDecoration(color: Colors.deepPurple)),)))
                ,

                InkWell(
                  onTap: setgesture,
                  child: GestureDetector(
                    child: Obx(
                          ()=> AnimatedCrossFade(
                        crossFadeState:setss.value?CrossFadeState.showFirst:CrossFadeState.showSecond ,
                        duration: Duration(seconds: 2),
                        firstChild: Container(
                          child: Text("Priyanshu satija"),
                          color: Colors.greenAccent,
                          width: 200,
                          height: 200,
                        ),
                        secondChild:Container(
                          child: Text("Priyanshu satija"),
                          color: Colors.red,
                          width: 200,
                          height: 200,
                        ) ,
                      ),
                    ),
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
  void setopacity(){
    if(op.value==1)
    {
      op.value=0.1;
    }
    else
    {
      op.value=1;
    }
  }

  void setgesture() {
    if(setss.value==true)
    {
      setss.value=false;
    }
    else
    {
      setss.value=true;
    }
  }
}