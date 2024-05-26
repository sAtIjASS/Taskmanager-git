import'package:flutter/material.dart';
import 'package:get/get.dart';
void main()
{
  runApp(appentrypoint());
}
class appentrypoint extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return GetMaterialApp(
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: ()=>firstscreen()),
          GetPage(name: '/secondScreen', page: ()=>secondscreen()),
          GetPage(name:'/ThirdScreen',page:()=>thirdscreen()),
        ]
    );
  }
}
class firstscreen extends StatefulWidget{
  @override
  State<firstscreen> createState() => firstscreenState();
}

class firstscreenState extends State<firstscreen> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("This is the first screen"),
            ElevatedButton(onPressed: (){
              Get.toNamed('/secondScreen');
            }, child: Text("Second")),
            ElevatedButton(onPressed: (){
              Get.toNamed('/ThirdScreen');
            }, child: Text("Third")),
          ],
        ))
    );
  }
}



class secondscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("This is the Second screen"),
          ElevatedButton(onPressed: (){
            Get.back();
          },child:Text("Pressed") ,)

        ],
      )),
    );
  }
}









class thirdscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("This is the Third screen"),
            ElevatedButton(onPressed: (){
              Get.back();
            },child:Text("Pressed") ,)

          ],
        )),
    );
  }
}