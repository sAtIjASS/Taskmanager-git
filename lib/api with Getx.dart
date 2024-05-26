import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'api with Getx.dart';

import'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
void main() {
  runApp( GetMaterialApp(
    home: MaterialApps(),
  ));
  return ;
}
logic apigetxcontroller =Get.put(logic());
class MaterialApps extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
               controller: apigetxcontroller.emailController.value,
                decoration: InputDecoration(
                  hintText: "Enter your email address",
                  border: OutlineInputBorder(),
                ),
              )



              ,

SizedBox(height: 20,),

              TextField(
                controller: apigetxcontroller.passwordController.value,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                apigetxcontroller.loginapi();
              }, child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}



class logic extends GetxController{

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

void loginapi() async{
  try{
    final response = await http.post(Uri.parse("https://reqres.in/api/login")
        ,body: {
          'email':emailController.value.text.toString(),
          'password':emailController.value.text.toString()
        });
    var data=jsonDecode(response.body.toString());
    print(data);
    if(response.statusCode==200){
      print("success");

      Timer(Duration(seconds: 10), (){
      CircularProgressIndicator();
      Get.snackbar("Login Successfully done ",'Congratulations');
      });

    }
    else{
      print("failed");
      Timer(Duration(seconds: 10), (){
           CircularProgressIndicator();
      print("login failed");
      });
    }

  }
  catch(e){
    Get.snackbar("Exception occur", e.toString());
  }
}
}