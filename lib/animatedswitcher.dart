import'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sf_p/animated8.dart';
void main() {
  runApp(setanimation());
}
class setanimation extends StatefulWidget{
  @override
  State<setanimation> createState() => setanimationState();
}
class setanimationState extends State<setanimation> {
  RxBool setvalue=false.obs;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Obx(
                    ()=> AnimatedSwitcher(
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    duration: Duration(seconds:1),
                    child:setvalue.value?Container(
                      key: UniqueKey(),
                      width: 200,
                      height: 200,
                      color: Colors.blue,
                      child: Text("Priyanshu satija"),
                    ):Container(
                      key: UniqueKey(),
                      width: 200,
                      height: 200,
                      color: Colors.greenAccent,
                      child: Text("Priyanshu"),
                    )
                ),
              ),
              ElevatedButton(onPressed: (){
                setvalue.value=!setvalue.value;
              }, child: Text("change"))
            ],
          ),
        ),
      ),
    );
  }
}