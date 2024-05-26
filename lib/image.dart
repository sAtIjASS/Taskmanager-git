import 'package:flutter/material.dart';

void main() {
  runApp(SetImage());
}

class SetImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://hips.hearstapps.com/pop.h-cdn.co/assets/cm/15/05/480x240/54ca71fb94ad3_-_5summer_skills_burger_470_0808-de.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            // Optionally, you can specify other properties for the Container, such as width and height
            width: 300,
            height: 200,
            // You can add child widgets here if needed
            child: YourChildWidget(),
          ),
        ),
      ),
    );
  }
}

// Optionally, you can define a separate widget for your child widget
class YourChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return YourWidget();
  }
}

// Your actual widget content can be placed here
class YourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return YourContent();
  }
}

// Your content widget can be defined here
class YourContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return YourImage();
  }
}

// Your image widget can be defined here
class YourImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network('https://example.com/your-image.jpg');
  }
}
