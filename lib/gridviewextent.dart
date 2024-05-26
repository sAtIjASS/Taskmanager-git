import 'package:flutter/material.dart';
void main()
{
  runApp(setvalue());
}
class setvalue extends StatefulWidget{
  @override
  State<setvalue> createState() => setvalueState();
}
class setvalueState extends State<setvalue>
{
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GridView.extent(maxCrossAxisExtent: 100,children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.blue,
            )
            ,          Container(

              color: Colors.greenAccent,
            ),
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.purpleAccent,
            )
          ],),
        ),
      ),
    );
  }
}