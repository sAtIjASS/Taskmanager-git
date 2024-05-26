import'package:flutter/material.dart';
void main() {
runApp(page());
}
class page extends StatefulWidget{
  @override
  State<page> createState() => pageState();
}


List<Widget> pages=[
  Container(
    color: Colors.blue,
    child: Center(
      child: Text('Page 1', style: TextStyle(fontSize: 24, color: Colors.white)),
    ),
  ),
  Container(
    color: Colors.red,
    child: Center(
      child: Text('Page 2', style: TextStyle(fontSize: 24, color: Colors.white)),
    ),
  ),
  Container(
    color: Colors.greenAccent,
    child: Center(
      child: Text('Page 3', style: TextStyle(fontSize: 24, color: Colors.white)),
    ),
  ),
  Container(
    color: Colors.black,
    child: Center(
      child: Text('Page 4', style: TextStyle(fontSize: 24, color: Colors.white)),
    ),
  ),
  Container(
    color: Colors.yellow,
    child: Center(
      child: Text('Page 5', style: TextStyle(fontSize: 24, color: Colors.white)),
    ),
  ),
];

PageController setnewpage=PageController(
  initialPage: 0
);
class pageState extends State<page> {

  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
      body:PageView(
        controller:setnewpage,
        onPageChanged: (index){
          setState(() {
            setnewpage.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.bounceIn);
          });
        },
        children: pages,
        scrollDirection: Axis.vertical,
      )
      )
    );
  }
}