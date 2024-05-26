import'package:flutter/material.dart';
void main()
{
  runApp(page());
}
class page extends StatefulWidget{
  @override
  State<page> createState() => pageState();
}

class pageState extends State<page> {
  @override
  PageController pageController = PageController();
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: pageController,
          children: [
            Container(
              color: Colors.purpleAccent,
              child: Text("Hello Priyanshu satija"),
            ),
            Container(
              color: Colors.greenAccent,
              child: Text(" Priyanshu satija"),
            ),
            Container(
              color: Colors.yellow,
              child: Text("satija"),
            ),
            Container(
              color: Colors.purple,
              child: Text("Hello "),
            ),
          ],
          onPageChanged: (int index) {
            setState(() {
              pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.bounceIn);
            });
          },
        ),
      ),
    );
  }
}