import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(GetMaterialApp(
    home: GetMaterialApps()
  ));
  return ;
}
class GetMaterialApps extends StatefulWidget {
  @override
  State<GetMaterialApps> createState() => _GetMaterialAppsState();
}

class _GetMaterialAppsState extends State<GetMaterialApps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
           if(snapshot.hasData)
             {
               return Container(
               child:Text("${snapshot.data}"),
               );
             }
           else
             {
               return
               Center(child: CircularProgressIndicator(),);
             }
          },
        ),
      );
  }
  Future <String> getdata() async
  {
    var get="Priyanshu satija";
    await Future.delayed( Duration(seconds: 10));
    return get;
  }
}


