import 'dart:io';

import 'package:get/get.dart';
import 'package:url_launcher/link.dart';
import'package:flutter/material.dart';
import'package:url_launcher/url_launcher.dart';
void main()
{
  runApp(GetMaterialApp(home: MaterialApp()));
  return ;
}
class MaterialApp extends StatefulWidget
{
  @override
  State<MaterialApp> createState() => _MaterialAppState();
}
var  url;
TextEditingController controller = new TextEditingController();
class _MaterialAppState extends State<MaterialApp> {
  String link="https://www.google.com/";

  Widget build(BuildContext context)
  {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              launchUrl(Uri.parse(link),mode:LaunchMode.inAppWebView);
            }, child: Text("open url")),
            SizedBox(height: 20,)
            ,
            TextField(controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
            ),
            ElevatedButton(onPressed: (){
              String savephone=controller.text.toString();
             call(savephone);
            }, child: Text("open url")),
SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
               mailto();
            }, child: Text("Email Address")),

          ],
        ),
      ),
    );
  }

  Future <void> call (String save)async{
    launchUrl(Uri(scheme: 'tel',path:"$save"),mode: LaunchMode.externalApplication);
  }



  Future <void> mailto ()async{
    launchUrl(Uri(scheme: 'sms',path:"8950363565"),mode: LaunchMode.externalApplication);
  }
}