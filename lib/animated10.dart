//animatedalign widget in this code is used
import'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(setanimation());
}
class setanimation extends StatefulWidget{
  @override
  State<setanimation> createState() => setanimationState();
}
class setanimationState extends State<setanimation>
{
  RxBool setvalue = false.obs;
  @override
  Widget build(BuildContext context)
  {
    return GetMaterialApp(
        home:Scaffold(
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                        ()=> AnimatedAlign(alignment: setvalue.value? Alignment.centerRight:Alignment.centerLeft, duration: Duration(seconds: 2),
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.deepPurple,
                        )),
                  ),
                  ElevatedButton(onPressed: (){
                    setvalue.value = !setvalue.value;
                  }, child: Text("Pressed"))
                ]
            ),
          ),
        )
    );
  }
}










