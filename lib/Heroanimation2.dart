

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:html';
void main()
{
  runApp(heros());
  return ;
}
class heros extends StatelessWidget{
  Widget build(BuildContext context)
  {
    return GetMaterialApp(
      home: Scaffold(
        body:Center(
          child: Hero(
            tag: 'background',
            child: Image.asset("assests/images/name.jpg",width: 300,height: 150,),
          ),
        ),
      ),
    );
  }
}