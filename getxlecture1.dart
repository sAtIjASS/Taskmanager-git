import'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
void main()
{
  runApp(GetMaterialApp(
      home: getfirst()));
  return ;
}
class getfirst extends StatefulWidget{
  @override
  State<getfirst> createState() => _getfirstState();
}

class _getfirstState extends State<getfirst> {
  counterController satija=Get.put(counterController());
  Widget build(BuildContext context)
  {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(satija.counter.string)),
            Text("PRIYANSHU YOU CAN DO IT "),
            ElevatedButton(onPressed: (){
              satija.increment();
            }, child: Text("Press"))
          ],
        ),
      ) ,
    );
  }
}




class counterController extends GetxController{
  RxInt  counter=1.obs;
  increment()
  {
    counter.value++;

  }
}