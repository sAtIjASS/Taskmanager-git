import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MediaQuery Example'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            // Example for 'of' method
            MediaQueryData mediaQueryData = MediaQuery.of(context);
            // Example for 'data' method
           // MediaQueryData mediaQueryData2 = MediaQuery.data(context);
            // Example for 'size' method
            Size screenSize = mediaQueryData.size;
            // Example for 'devicePixelRatio' method
            double devicePixelRatio = mediaQueryData.devicePixelRatio;
            // Example for 'padding' method
            EdgeInsets padding = mediaQueryData.padding;
            // Example for 'orientation' method
            Orientation orientation = mediaQueryData.orientation;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Size: $screenSize'),
                  Text('Device Pixel Ratio: $devicePixelRatio'),
                  Text('Padding: $padding'),
                  Text('Orientation: $orientation'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
