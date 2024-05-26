//Animation Switcher in flutter  It is Widgets
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<MyApp> createState() => homepage();
}

class homepage extends State<MyApp> {
  @override
  RxBool setvalue = false.obs;

  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => AnimatedSwitcher(
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  duration: Duration(milliseconds: 500),
                  child: setvalue.value
                      ? Container(
                          key: UniqueKey(),
                          width: 100,
                          height: 100,
                          color: Colors.greenAccent,
                          child: Center(child: Text("Hello")),
                        )
                      : Container(
                         key:UniqueKey(),
                         width: 100,
                         height: 100,
                         color: Colors.blueAccent,
                         child: Center(child: Text("Bye",style: TextStyle(color: Colors.white),)),
                        ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setvalue.value = !setvalue.value;
                },
                child: Text("Pressed"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
