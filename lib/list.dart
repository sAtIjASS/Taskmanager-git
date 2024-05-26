import'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: list()));
}

class list extends StatelessWidget {
  List <Map<String , dynamic >>value=[
    {
      "name":"sachin",
      "age":20
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: ListView.builder( itemCount: value.length,itemBuilder: (context, index) {
        return Column(
          children: [
            Text("${value[index]["name"]}"),
          Text("${value[index]["age"]}"),
          ],
        );

      }),
    );
  }
}