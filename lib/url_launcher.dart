import 'package:url_launcher/url_launcher.dart';
import'package:flutter/material.dart';
void main() {
  runApp(url());
  return ;
}
class url extends StatelessWidget{
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            launchUrl(Uri(scheme: 'tel',path:'8950363565'), mode:LaunchMode.externalApplication);
          }, child: Text("Call")),

          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            launchUrl(Uri(scheme: 'sms',path: '8950363565'),mode:LaunchMode.externalApplication);
          }, child: Text("Sms")),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            launchUrl(Uri.parse("https://www.google.com/"),mode:LaunchMode.externalApplication);
          }, child: Text("Google")),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
           launchUrl(Uri(scheme: 'mailto',path:'satija286@gmail.com'),mode:LaunchMode.externalApplication);
          }, child: Text("Email")),

        ],
      ),
        )
      ),
    );
  }
}