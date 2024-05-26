import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
void main()
{
   runApp(appentrypoint());
}
class appentrypoint extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      home: Scaffold(
        body:
        Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              Get.snackbar("Hello","Priyanshu Satija");
            }, child: Text("Pressed")),
            ElevatedButton(
              onPressed: (){
                Fluttertoast.showToast(msg: "Priyanshu satija is developer", gravity: ToastGravity.CENTER);
              },child: Text("Pressed"),
            ),
          ],
        ),),
      ),
    );
  }
}