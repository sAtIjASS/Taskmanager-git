import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main()
{
  runApp(ok());
  return;
}
class ok extends StatefulWidget{
  State<ok>createState()=>second();
}
class second extends State<ok>
{
  getcolor satija=Get.put(getcolor());







  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: ListView.builder(
          itemBuilder:(context, index)
          {
            return Card(
              child: ListTile(
                  onTap: (){


                    if(satija.tempf.contains(satija.fruit[index].toString()))
                    {
                      satija.removecontroller(satija.fruit[index].toString());                    }
                    else
                    {
                      satija.addcontroller(satija.fruit[index].toString());
                    }










                  },
                  title: Text(satija.fruit[index].toString()),
                  trailing: Obx(()=>Icon(Icons.favorite,color:satija.tempf.contains(satija.fruit[index].toString())? Colors.red:Colors.black,),)
              ),
            );
          },
          itemCount: satija.fruit.length,
        ),
      ),
    );
  }
}

class getcolor extends GetxController{

  RxList<dynamic>tempf=[].obs;
  RxList<String> fruit=["orange","apples","mango","banana"].obs;

  addcontroller(String value){
  tempf.add(value);

  }
  removecontroller(String value)
  {
    tempf.remove(value);
  }
}