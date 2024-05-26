import 'package:flutter/material.dart';
import'package:get/get.dart';
import 'package:sf_p/animated8.dart';
void main() {
  runApp(setanimation());
}
class setanimation extends StatefulWidget{
  @override
  State<setanimation> createState() => setanimationState();
}
class setanimationState extends State<setanimation>
{
  @override
  Widget build(BuildContext context)
  {
    return GetMaterialApp(
      home: Scaffold(
        body: homepage(),
      ),
    );
  }
}


class homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
      child:  ElevatedButton(
        onPressed: (){
          showDialog(context: context, builder:(context)
          {
            return MyDialog();
          });
        },
        child: Text("Pressed"),
      ),
      )
    );
  }
}
class MyDialog extends StatelessWidget{
  Widget build(BuildContext context){
return Dialog(
  child: AnimatedContainer(
    duration: Duration(seconds: 2),
    color:Colors.black.withOpacity(0.2),
    child: Column(
      mainAxisSize:MainAxisSize.min,
      children: [
        SizedBox(height: 20),
        Text(
          "Animated Model Barrier",
          style: TextStyle(color:Colors.greenAccent,fontSize: 20),
        ),
        SizedBox(height: 20,),
        ElevatedButton(
          onPressed: (){
            Navigator.of(context).pop();
          },child: Text("Pressed"),
        ),
        SizedBox(height: 20,),
      ]
    )
  ),
);
  }
}