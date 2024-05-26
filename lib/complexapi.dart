import 'dart:convert';
import 'package:http/http.dart' as http;
import'package:flutter/material.dart';
void main()
{
  runApp(MyApp());
}
List <Welcome>data=[];
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Complex API'),
        ),
        body: Center(
          child:FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                   return ListView.builder(itemBuilder: (context, index) {

                Text("${data[index].title}");
                Text("${data[index].id}");
                Text("${data[index].albumId}");
                Text("${data[index].url}");
                Text("${data[index].thumbnailUrl}");

                   });
              }
              else
                {
                  return CircularProgressIndicator();
                }
            },
          )
        ),
      ),
    );
  }
  Future getData() async {
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
var save =jsonDecode(response.body.toString());
if(response.statusCode==200)
  {
    for(Map<String, dynamic> i in save)
      {
        data.add(Welcome.fromJson(i));
      }
    return save;
  }
else
  {
    return save;
  }
  }
}




















// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Welcome({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
