// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Wel> welcomeFromJson(String str) => List<Wel>.from(json.decode(str).map((x) => Wel.fromJson(x)));

String welcomeToJson(List<Wel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Wel {
  List<String> size;
  String description;
  String image;

  Wel({
    required this.size,
    required this.description,
    required this.image,
  });

  factory Wel.fromJson(Map<String, dynamic> json) => Wel(
    size: List<String>.from(json["size"].map((x) => x)),
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "size": List<dynamic>.from(size.map((x) => x)),
    "description": description,
    "image": image,
  };
}
