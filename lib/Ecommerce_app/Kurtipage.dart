//This page is Responsible for the Kurti Section Details
import'kurtiapi.dart';
import 'dart:convert';
import 'Page3eapp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'Mobileapi.dart';
import 'package:http/http.dart' as http;

import 'curvednavigationbar.dart';
RxInt storevalue=0.obs;
int r=500;
class kurti  extends StatelessWidget{
  List <Wel> dataofkurti = [];
  List<Map<dynamic,dynamic>> mobilelist=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mobiledata(dataofkurti),
    );
  }




}

