import "package:flutter/material.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
// var to store
// onChanged callback
  late String title;
  String text = "No Value Entered";

  void _setText() {
    setState(() {
      text = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeeksforGeeks'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              onChanged: (value) => title = value,
            ),
          ),
          const SizedBox(
            height: 8,
          ),

          ElevatedButton(
              onPressed: _setText,
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(8),
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: const Text('Submit')),
          // RaisedButton is deprecated and should not be used
          // Use ElevatedButton instead

          // RaisedButton(
          //	 onPressed: _setText,
          //	 child: Text('Submit'),
          //	 elevation: 8,
          // ),
          const SizedBox(
            height: 20,
          ),
          Text(text),
          // changes in text
          // are shown here
        ],
      ),
    );
  }
}
