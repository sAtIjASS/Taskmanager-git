import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  State<MyApp> createState() => setanimation();
}
class setanimation extends State<MyApp>{
  int  w=200,h=100;
  bool setvalue=false;
  var setcolor=Colors.blue;
  Decoration myDecoration=BoxDecoration(
    borderRadius: BorderRadius.circular(20),
  );
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(duration:Duration(seconds: 3)
                ,width: w.toDouble(),
              curve: Curves.bounceIn,
              height: h.toDouble(),
              decoration: myDecoration,)

            ,ElevatedButton(onPressed: (){
              setState(() {
              if(setvalue)
                {
                  w=100;
                  h=400;
                  setcolor=Colors.deepPurple;

                  setvalue=false;
                  myDecoration=BoxDecoration(
                  color: setcolor,
                      borderRadius: BorderRadius.circular(100)
                );
                }
              else
                {
                  w=400;
                  h=100;
                  myDecoration=BoxDecoration(
                    color:setcolor,
                    borderRadius: BorderRadius.circular(100)
                  );
                  setcolor=Colors.deepPurple;
                  setvalue=true;
                }
              });
              }, child: Text("Pressed"))]
          ),
        ),
      ),
    );
  }
}