import'package:flutter/material.dart';
void main()
{
  runApp(app());
}
class app extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
            children: [
              Container(
                width: 400,
                height: 400,
                color: Colors.redAccent,
              ),
              Container(
                width: 300,
                height: 300,
                color: Colors.blue,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.green,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),


            ]
        ),
      ),
    );
  }
}