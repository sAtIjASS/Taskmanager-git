import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

void main() {
  runApp(GetMaterialApp(home: setanimation()));
}

class setanimation extends StatefulWidget {
  @override
  State<setanimation> createState() => setanimationState();
}

class setanimationState extends State<setanimation>
    with SingleTickerProviderStateMixin {
  RxDouble w = 200.0.obs;
  RxDouble h = 200.0.obs;
  RxBool op = true.obs;
  RxBool setvalue = true.obs;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Priyanshu Satija"),
              Obx(
                () => AnimatedContainer(
                  duration: Duration(seconds: 1),
                  color: Colors.red,
                  width: w.toDouble(),
                  height: h.toDouble(),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (w.value == 200 && h.value == 200) {
                      w.value = 100;
                      h.value = 100;
                    } else {
                      w.value = 200;
                      h.value = 200;
                    }
                  },
                  child: Text("PRESSED")),
              SizedBox(
                height: 20,
              ),

              //AnimatedCrossFade widget
              Obx(
                () => AnimatedCrossFade(
                    firstChild: Container(
                      color: Colors.blue,
                      width: 200,
                      height: 200,
                    ),
                    secondChild: Container(
                      color: Colors.yellow,
                      width: 200,
                      height: 200,
                    ),
                    crossFadeState: setvalue.value
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(seconds: 3)),
              ),
              ElevatedButton(
                  onPressed: () {
                    setvalue.value = !setvalue.value;
                  },
                  child: Text("Change")),
              //Animatedopacity widget
              Obx(() => AnimatedOpacity(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                  ),
                  opacity: op.value ? 1.0 : 0.0,
                  duration: Duration(seconds: 2))),
              ElevatedButton(
                  onPressed: () {
                    op.value = !op.value;
                  },
                  child: Text("CHANGE OPACITY ")),
              SizedBox(
                height: 20,
              ),
              //Animatedswitcher widget
              Obx(
                () => AnimatedSwitcher(
                    duration: Duration(seconds: 2),
                    child: setvalue.value
                        ? Container(
                            color: Colors.red,
                            width: 50,
                            height: 50,
                          )
                        : Container(
                            width: 50,
                            height: 50,
                            color: Colors.blue,
                          )),
              ),
              TextButton(
                  onPressed: () {
                    setvalue.value = !setvalue.value;
                  },
                  child: Text("Change")),
              SizedBox(
                height: 20,
              ),
              //Animated Align widget
              Obx(() => AnimatedAlign(
                  alignment:
                      setvalue.value ? Alignment.center : Alignment.topLeft,
                  duration: Duration(seconds: 1),
                  child: Container(
                    color: Colors.green,
                    width: 50,
                    height: 50,
                  ))),
              ElevatedButton(
                  onPressed: () {
                    setvalue.value = !setvalue.value;
                  },
                  child: Text("Change")),
              Obx(() => AnimatedSize(
                  duration: Duration(seconds: 1),
                  child: Container(
                    color: Colors.green,
                    width: w.value,
                    height: h.value,
                  ))),
              ElevatedButton(
                onPressed: () {
                  if (w.value == 200 && h.value == 200) {
                    w.value = 100;
                    h.value = 100;
                  }
                  else{
                    w.value = 200;
                    h.value = 200;
                  }
                },
                child: Text("Press"),
              ),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}
