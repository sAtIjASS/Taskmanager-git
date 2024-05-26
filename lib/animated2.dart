import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(home: CrossFadeDemo()));
}



class CrossFadeDemo extends StatefulWidget {
  @override
  State <CrossFadeDemo> createState() => CrossFadeDemoState();
}

class CrossFadeDemoState extends State<CrossFadeDemo> {
  bool _first = true;

  void _toggle() {
    setState(() {
      _first = !_first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cross Fade Demo'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () => _toggle(),
            child: AnimatedCrossFade(
              crossFadeState: _first?CrossFadeState.showFirst:CrossFadeState.showSecond,
              duration: Duration(seconds: 1),
              firstChild: Container(

                width: 300,
                height: 300,
                color: Colors.blue,
              ),
              secondChild:Container(

                width: 300,
                height: 300,
                color: Colors.green,
              ) ,
            ),
          ),
        )
    );
  }
}





