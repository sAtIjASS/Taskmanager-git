import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
      home: Scaffold(
        body: Center(
          child: MyAnimatedContainer(),
        ),
      ),
    );
  }
}

class MyAnimatedContainer extends StatelessWidget {

  final RxBool sets = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
        ()=> AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.bounceIn,
            width: sets.value ? 200:100,
            height: sets.value ? 200:100,
            color: Colors.deepPurple,
          ),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
toggleSize();
    },
          child: Text("Toggle Size"),
        ),
      ],
    );
  }

  void toggleSize() {
    sets.value=!sets.value;
  }
}
