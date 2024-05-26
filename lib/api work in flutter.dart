import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
void main(){
  runApp(GetMaterialApp(home: MyApp()));
  return ;
}
List<Welcome>data=[];
class MyApp extends StatelessWidget{
Widget build (BuildContext context){
  return Scaffold(
    body:FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                width: 400,
                height: 400,
                child: Column(
                  children: [
                    Text("${data[index].userId}"),
                    Text("${data[index].id}"),
                    Text("${data[index].title}"),
                    Text("${data[index].body}"),
                  ],
                ),
              );
            },
            itemCount: data.length,
          );
        } else {
          return Center(
            child: Column(
              children: [
                CircularProgressIndicator(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Pressed"),
                )
              ],
            ),
          );
        }
      },
    ),
  );
}




Future<List<Welcome>> getData() async {
  var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  var save = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map<String, dynamic> index in save) {
      data.add(Welcome.fromJson(index));
    }
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}
}




































// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  int userId;
  int id;
  String title;
  String body;

  Welcome({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}



