
//Animation with getx
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late Animation<Color?> colorAnimation;
  late AnimationController animationController;
  RxDouble startpoint = 0.0.obs;
  RxDouble endpoint = 100.0.obs;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    animation = Tween(begin: startpoint.value, end: endpoint.value)
        .animate(animationController);
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.orange)
        .animate(animationController);
    animation.addListener(() {
      startpoint.value = animation.value;
    });
  }

  void start() {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
                  () => Container(
                color: colorAnimation.value,
                width: startpoint.value, // Use startpoint.value directly
                height: startpoint.value, // Use startpoint.value directly
                child: Text("Hello world"),
              ),
            ),
            ElevatedButton(
              onPressed: start,
              child: Text("Start Animation"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

