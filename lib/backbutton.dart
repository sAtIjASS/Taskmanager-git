import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(GetMaterialApp(
      initialRoute:'/',
      routes:{
        '/appentrypoint':(context)=>appentrypoint(),
        '/secondpage':(context)=>secondpage(),
        '/thirdpage':(context)=>thirdpage(),
  },home: appentrypoint()));
}
class appentrypoint extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
             Navigator.pushNamed(context,'/secondpage');
          }, child: Text("SECOND PAGE ")),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context,'/thirdpage');
          }, child: Text("THIRD PAGE "))
        ]
      ),
    );
  }
}




class secondpage extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("FIRST PAGE ")),
            ],
          ),
        ),
      ),
    );
  }
}


class thirdpage extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
ElevatedButton(onPressed: (){
  Navigator.pop(context);
}, child: Text("FIRST PAGE"))
            ],
          ),
        ),
      ),
    );
  }
}


