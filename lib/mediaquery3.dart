import 'package:flutter/material.dart';

class MediaQueryExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the media query data
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    // Get device size
    Size size = mediaQueryData.size;
    double screenWidth = size.width;
    double screenHeight = size.height;

    // Get orientation
    Orientation orientation = mediaQueryData.orientation;

    // Get device pixel ratio
    double pixelRatio = mediaQueryData.devicePixelRatio;

    // Get text scale factor
    double textScaleFactor = mediaQueryData.textScaleFactor;

    // Get system padding
    EdgeInsets systemPadding = mediaQueryData.padding;

    // Get system insets
    EdgeInsets systemInsets = mediaQueryData.viewInsets;

    // Get the device's safe area
    EdgeInsets safeArea = mediaQueryData.padding.copyWith(
      top: mediaQueryData.padding.top + mediaQueryData.viewPadding.top,
      bottom: mediaQueryData.padding.bottom + mediaQueryData.viewPadding.bottom,
      left: mediaQueryData.padding.left + mediaQueryData.viewPadding.left,
      right: mediaQueryData.padding.right + mediaQueryData.viewPadding.right,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('MediaQuery Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Screen Width: $screenWidth'),
          Text('Screen Height: $screenHeight'),
          Text('Orientation: $orientation'),
          Text('Device Pixel Ratio: $pixelRatio'),
          Text('Text Scale Factor: $textScaleFactor'),
          Text('System Padding: $systemPadding'),
          Text('System Insets: $systemInsets'),
          Text('Safe Area: $safeArea'),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MediaQueryExample(),
  ));
}
