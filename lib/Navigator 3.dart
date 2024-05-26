import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sf_p/animated11.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
  home: appentrypoint(),
  initialRoute: '/',
  getPages: [
    GetPage(name: '/', page: ()=>appentrypoint()),
    GetPage(name: '/SecondRoute',page:()=>SecondRoute()),
    GetPage(name: '/fourthRoute', page: ()=>fourthRoute()),

  ],
  ));
}

class appentrypoint extends StatefulWidget {
  @override
  State<appentrypoint> createState() => appentrypointState();
}

class appentrypointState extends State<appentrypoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/SecondRoute');
              },child:  Text("Click me"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/fourthRoute');
              },child:  Text("Click me"),
            ),
          ],
        )
    ));
  }
}

//second class
class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Click Me Page"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Home!'),
        ),
      ),
    );
  }
}






//second class
class fourthRoute extends StatelessWidget {
  const fourthRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Click Me Page"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Home!'),
        ),
      ),
    );
  }
}
