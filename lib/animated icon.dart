import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedIconDemo(),
    );
  }
}

class AnimatedIconDemo extends StatefulWidget {
  @override
  _AnimatedIconDemoState createState() => _AnimatedIconDemoState();
}

class _AnimatedIconDemoState extends State<AnimatedIconDemo>
    with SingleTickerProviderStateMixin {
 late AnimationController animationController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    if (_isPlaying) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Icon Demo'),
      ),
      body: Center(
        child: IconButton(
          iconSize: 60,
          icon: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: animationController,
          ),
          onPressed: _toggleAnimation,
        ),
      ),
    );
  }
}
