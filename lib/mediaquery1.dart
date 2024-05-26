import'package:flutter/material.dart';
import 'package:get/get.dart';
void main()
{
  runApp(appentrypoint());
}
class appentrypoint extends StatelessWidget
{
  late var size,width,height;
  @override
  Widget build(BuildContext context)
  {
    size=MediaQuery.of(context).size;
    width=size.width;
    height=size.height;
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
 Container(
   child: ElevatedButton(

     onPressed: (){
       Get.snackbar("Height is   $height","Width is $width");
     },
     child: Text("Pressed"),
   ),
   color: Colors.deepPurpleAccent,
   height:height/3,
   width: width/2,
 )
            ],
          ),
        ),
      ),
    );
  }
}