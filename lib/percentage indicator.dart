  import 'package:flutter_spinkit/flutter_spinkit.dart';
  import'package:percent_indicator/percent_indicator.dart';
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:get/get_navigation/get_navigation.dart';
  import 'package:sf_p/main.dart';
  void main()
  {
    runApp(GetMaterialApp(
        home: getfirst()));
    return ;
  }
  class getfirst extends StatefulWidget{
    @override
    State<getfirst> createState() => getsecond();
  }
  class getsecond extends State<getfirst> {
    Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: InkWell(
                    child: CircularPercentIndicator(
                      radius: 60.0,
                      addAutomaticKeepAlive: true,
                      animateFromLastPercent: true,
                      reverse: false,
                      animation: true,
                      center: const Text(
                        '100%', style: TextStyle(color: Colors.black),),
                      restartAnimation: true,
                      rotateLinearGradient: true,
                      animationDuration: 8000,
                      lineWidth: 12.0,
                      percent: 1.0,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.greenAccent,
                      progressColor: Colors.blue,
                    ),
                    onTap: () {
                      Get.to(MyApp());
                    },)
              ),


              SizedBox(height: 40,),


              presson()
,
              SizedBox(height: 40,),


              satija()
            ],
          ),
        ),
      );
    }

    Widget presson() {
      return Container(
        width: 300,
        height: 300,
        color: Colors.black,
        child: SpinKitRotatingCircle(
          size: 500,
          duration: Duration(seconds: 10),
          itemBuilder: (context, index) {
            return DecoratedBox(
              decoration: BoxDecoration(

                color: Colors.orangeAccent.shade100.withOpacity(0.9),
                shape: BoxShape.circle,

               boxShadow: [BoxShadow(color: Colors.greenAccent.withOpacity(1.0), blurRadius: 5)]
              ),
              // You can use the index parameter here if needed
            );
          },
        ),
      );
    }
  }


  Widget satija() {
    return SpinKitHourGlass(
      color: Colors.blue, // Set the color of the spinner
      size: 50.0, // Set the size of the spinner
    );
  }