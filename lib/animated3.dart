
import'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(GetMaterialApp(home: fluttermyapp()));
}
class fluttermyapp extends StatefulWidget{
  State<fluttermyapp> createState() => fluttermyappState();
}
class fluttermyappState extends State<fluttermyapp>
{
  bool setvalue=false;
  var op=0.1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedOpacity(
                curve: Curves.bounceIn,
                opacity:op,
                duration: Duration(seconds: 3),
                child: Container(
                  height: 200,
                  width:200,
                  child: Padding(
                    padding: const EdgeInsets.all(48.0),
                    child: Text("Hello world"),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(50)
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                if(!setvalue)
                {
                  setState(() {

                    op=1;
                    setvalue=true;
                  });
                }
                else
                {
                  setState(() {
                    op=0.1;
                    setvalue=false;
                  });
                }
              } , child: Text("Pressed"))
            ],
          ),
        )
    );
  }
}