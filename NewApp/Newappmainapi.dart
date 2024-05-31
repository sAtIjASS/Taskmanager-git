import 'dart:convert';
import 'package:http/http.dart' as http;

List<New> dataofnew = [];
// To parse this JSON data, do
//
//     final new = newFromJson(jsonString);

List<New> newFromJson(String str) => List<New>.from(json.decode(str).map((x) => New.fromJson(x)));

String newToJson(List<New> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class New {
  Source source;
  String? author;
  String? title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String content;

  New({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory New.fromJson(Map<String, dynamic> json) => New(
    source: Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}

class Source {
  String? id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

//This is the function of the  api Of New
Future<List<New>> getdataofnew() async {
  final response = await http.get(Uri.parse('https://mocki.io/v1/613cdad4-f88d-42a0-9326-7618027001b1'));
  final save = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    dataofnew.clear();
    for (Map<String, dynamic> index in save) {
      dataofnew.add(New.fromJson(index));
    }
    return dataofnew;
  } else {
    return dataofnew;
  }
}
