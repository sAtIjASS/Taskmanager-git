import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:sf_p/messagewidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GenerativeModel model; // corrected variable declaration
  late ChatSession _chatSession;

  @override
  void initState() {
    model = GenerativeModel(model: 'gemini.pro', apiKey: 'AIzaSyBHMVQAxe0Ni7OpgW8sHUimrDWzzfTEiU8'); // replace 'YOUR_API_KEY' with your actual API key
    _chatSession=model.startChat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child:Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Expanded(child: ListView.builder(itemBuilder: (context,index){
                  return MessageWidget(text: text, sender: content.role=="usr")
                })),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
