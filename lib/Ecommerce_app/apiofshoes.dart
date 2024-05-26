// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  String name;
  String model;
  List<String> sizeAvailable;
  List<String> colorAvailable;
  String description;
  int price;
  List<String> images;

  Welcome({
    required this.name,
    required this.model,
    required this.sizeAvailable,
    required this.colorAvailable,
    required this.description,
    required this.price,
    required this.images,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    name: json["name"],
    model: json["model"],
    sizeAvailable: List<String>.from(json["size_available"].map((x) => x)),
    colorAvailable: List<String>.from(json["color_available"].map((x) => x)),
    description: json["description"],
    price: json["price"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "model": model,
    "size_available": List<dynamic>.from(sizeAvailable.map((x) => x)),
    "color_available": List<dynamic>.from(colorAvailable.map((x) => x)),
    "description": description,
    "price": price,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}
