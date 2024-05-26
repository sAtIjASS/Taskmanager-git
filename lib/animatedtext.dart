
import 'package:animated_text_kit/animated_text_kit.dart';
import'package:flutter/material.dart';
import 'package:get/get.dart';
void main()
{
  runApp(appentrypoint());
}
class appentrypoint extends StatefulWidget{
  @override
  State<appentrypoint> createState() => appentrypointState();
}

class appentrypointState extends State<appentrypoint> {
  @override
  void initState()
  {
    super.initState();
  }

  Widget build(BuildContext context)
  {
    return GetMaterialApp(home: Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 30.0,
                height: 100.0,

              ),
              Text(
                'Be',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 43.0),
              ),
              SizedBox(
                width: 30.0,
                height: 100.0,
              ),
              DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 20.0,

                  ),
                  child:AnimatedTextKit(animatedTexts: [
                    RotateAnimatedText('AWESOME'),
                    RotateAnimatedText('OPTIMISTIC'),
                    RotateAnimatedText('DIFFERENT'),
                  ])
              ),

            ],
          ),
          SizedBox(
            width: 250.0,
            child: TextLiquidFill(
              text: "Flutter",
              waveColor: Colors.blueAccent,
              boxBackgroundColor: Colors.yellow,
              textStyle: TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
              boxHeight: 300.0,
            ),
          ),
        ],
      ) ,
    ));
  }
}