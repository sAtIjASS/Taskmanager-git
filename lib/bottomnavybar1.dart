import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  PageController setpages=PageController();
  int currentindex=0;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: PageView(
              controller: setpages,
              children: [


            Container(
              child: Padding(
                padding: const EdgeInsets.all(80.0),
                child: Text("Priyanshu satija"),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(80.0),
                child: Text("Priyanshu "),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(80.0),
                child: Text("Satija"),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(80.0),
                child: Text("Priyanshu "),
              ),
            ),
          ]),
        ),
        bottomNavigationBar: BottomNavyBar(
          showElevation: true,
          mainAxisAlignment: MainAxisAlignment.center,
          containerHeight: 55.0,
          curve: Curves.bounceIn,
          backgroundColor: Colors.white,
          selectedIndex: currentindex,
          onItemSelected: (index)=>setState(() {
            currentindex = index;
            setpages.animateToPage(index , duration: Duration(seconds: 3), curve:Curves.bounceIn);

          }),
          items: [
            BottomNavyBarItem(icon: Icon(Icons.home), title: Text("Home")),
            BottomNavyBarItem(icon: Icon(Icons.home), title: Text("Home")),
            BottomNavyBarItem(icon: Icon(Icons.home), title: Text("Home")),
            BottomNavyBarItem(icon: Icon(Icons.home), title: Text("Home")),
          ],
        ),
      ),
    );
  }
}
