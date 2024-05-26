import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(home: Api1()));
}

class Api1 extends StatefulWidget {
  @override
  State<Api1> createState() => _Api1State();
}

class _Api1State extends State<Api1> {
  List<Welcome> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  width: 400,
                  height: 300,
                  child: Column(
                    children: [
                      Text("${data[index].data.id}"),
                      Text("${data[index].support.url}"),
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
    var response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
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































class Welcome {
  Data data;
  Support support;

  Welcome({
    required this.data,
    required this.support,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    data: Data.fromJson(json["data"]),
    support: Support.fromJson(json["support"]),
  );
}

class Data {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  Data({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );
}

class Support {
  String url;
  String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"],
    text: json["text"],
  );
}
