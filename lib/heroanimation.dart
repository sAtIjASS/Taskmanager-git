import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Example',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CountController countController = Get.put(CountController());

  bool notification=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GetX Example'),
        ),
        body:   Row(
          children: [
            Text("Notifications"),
            Obx(() => Switch(value: countController.changevalue.value, onChanged:(value)
            {
              countController.change(value);
            }))

          ],
        )
    );
  }
}

class CountController extends GetxController{
  RxBool changevalue=true.obs;
  void change(bool value)
  {
    changevalue.value=value;
  }
}




























