import'package:flutter/material.dart';
import 'package:get/get.dart';
void main(){
  runApp(MY());
}
RxDouble setpadding=0.0.obs;
class MY extends StatefulWidget{
  @override
  State<MY> createState() => _MYState();
}

class _MYState extends State<MY> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body:Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Obx(
                    ()=> Padding(
                    padding: EdgeInsets.all(setpadding.value),
                    child: ( Text("Priyanshu satija",style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ),
              ElevatedButton(
              onPressed: toggoled
                  ,child: ( Text("Pressed"))
              )
            ],
          ),
        ) ,
      ),
    );
  }
  void toggoled(){
    if(setpadding.value==0.0)
      {
        setpadding.value=10.0;
      }
    else{
      setpadding.value=0.0;
    }
  }
}