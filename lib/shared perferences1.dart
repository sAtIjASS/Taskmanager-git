import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(MyAppss());
}
class MyAppss extends StatefulWidget {
  @override
  State<MyAppss> createState() => _MyAppssState();
}

class _MyAppssState extends State<MyAppss> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child:Column(
            children: [
              Text("Email Page"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.blue),
                    borderRadius: BorderRadius.circular(20),
                    gapPadding: 10
                  ),
                )
              ),
              SizedBox(height: 20,),
              TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.blue),
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 10
                    ),
                  )
              )
              ,
              ElevatedButton(onPressed: (){

        }, child: Text("pressed")),
            ]
          )
        ),
      ),
    );
  }
}

void shared()async
{
  var save=await SharedPreferences.getInstance();
  save.setString('name', 'Priyanshu satija');
}