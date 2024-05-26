import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sf_p/Ecommerce_app/Mobilesection.dart';

import '../Electricalitem.dart';
import '../laptop.dart';
import '../packetfood.dart';
import '../settingpage.dart';
import '../stationary.dart';
Widget MyApppage4()
{
  final controller = Get.put(AnimatedSwitcherController());
  return
  Scaffold(
    appBar: AppBar(
      title: Text("Ecommerce App",style: TextStyle(color: Colors.white) ,),
      backgroundColor: Colors.blue,
      centerTitle: true,
    ),
    body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          //This is the code of the animated switcher which is the Left side of the page
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return GestureDetector(
                    onTap: () => controller.switchWidget(index),
                    child:
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          width: 100,
                          height: 100,
                          child: iconwidget(index),
                          decoration: BoxDecoration(
                            boxShadow: [BoxShadow(blurStyle: BlurStyle.outer, color: Colors.blue, blurRadius: 3,spreadRadius: 2)],
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                        ),
                      ],
                    )

                );
              }),
            ),
          ),
          //This is the code of the animated switcher which is the Right side of the page
          Expanded(
            child: GetBuilder<AnimatedSwitcherController>(
              builder: (context) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: controller.widgets[controller.currentIndex],
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}




class AnimatedSwitcherController extends GetxController {
  var currentIndex = 0;

  final List<Widget> widgets = [


    mobile(),
    packetfoodclass(),
    stationaryclass(),
    Electricalitemclass(),
    laptopclass(),
    settingpage(),
  ];

  final List<int> listofwidgets = [1,2,3,4,5,6];
  void switchWidget(int index) {
    currentIndex = index;
    update();  // Notifies GetBuilder to rebuild the widgets
  }

}


//this is the Widget for the set the Icon according to the index
Icon iconwidget(int index) {
  switch (index) {
    case 0:
      return Icon(Icons.mobile_friendly, size: 50,color: Colors.blue,);
    case 1:
      return Icon(Icons.fastfood, size: 50,color: Colors.blue,); // Packet food item icon
    case 2:
      return Icon(Icons.brush, size: 50 ,color: Colors.blue,); // Stationery item icon
    case 3:
      return Icon(Icons.electrical_services, size: 50,color: Colors.blue,); // Electrical icon
    case 4:
      return Icon(Icons.computer, size: 50,color: Colors.blue,); // Example additional icon
    case 5:
      return Icon(Icons.settings, size: 50,color: Colors.blue,); // Example additional icon
    default:
      return Icon(Icons.error, size: 50,color: Colors.blue,); // Default icon
  }
}

















