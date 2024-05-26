import'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(setanimation());
}

class setanimation extends StatefulWidget{
  @override
  State<setanimation> createState() => setanimationState();
}
class setanimationState extends State<setanimation> {
  @override
  var arrdata;
  List demi = ['Rahul','Rakul','sumit','Mohit','Rakul Singh'];
  List setmapvalues=[
    {
      'name':"Priyanshu ",
      'Lastname':"satija"
    },
    {
      'name':"Mohit ",
      'Lastname':"Kumar"
    }
    ,{
      'name':"Rohit",
      'Lastname':"Singh"
    },
    {
      'name':"Vikas ",
      'Lastname':"Banger"
    }



  ];
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:ListView(
          children: setmapvalues.map((e){
            return Container(
              margin: EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(
                color:Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text(e['name'].toString(),style: TextStyle(color: Colors.green,fontSize: 20,),)),);
          }).toList(),
        ),
      ),
    );
  }
}