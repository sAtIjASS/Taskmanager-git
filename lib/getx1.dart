import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(home: Getx1()));
}

class Getx1 extends StatelessWidget {
  final GetChange satija = Get.put(GetChange());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Container(
            color: Colors.red.withOpacity(satija.changecolor.value),
            width: 200,
            height: 200,
          )),
          SizedBox(height: 20),
          Obx(() => Slider(
            value: satija.changecolor.value,
            onChanged: (value) => satija.changeincolor(value),
          )),
        ],
      ),
    );
  }
}

class GetChange extends GetxController {
  RxDouble changecolor = 0.2.obs;

  void changeincolor(double value) {
    changecolor.value = value;
  }
}
