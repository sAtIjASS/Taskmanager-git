// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcomessss> welcomeFromJson(String str) => List<Welcomessss>.from(json.decode(str).map((x) => Welcomessss.fromJson(x)));

String welcomeToJson(List<Welcomessss> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcomessss {
  String name;
  String image;
  String description;
  String price;
  Brandname brandname;

  Welcomessss({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.brandname,
  });

  factory Welcomessss.fromJson(Map<String, dynamic> json) => Welcomessss(
    name: json["name"],
    image: json["image"],
    description: json["description"],
    price: json["price"],
    brandname: brandnameValues.map[json["Brandname"]]!,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "description": description,
    "price": price,
    "Brandname": brandnameValues.reverse[brandname],
  };
}

enum Brandname {
  APPLE,
  ONE_PLUS,
  OPPO,
  REALME,
  REDMI,
  SAMSUNG,
  VIVO
}

final brandnameValues = EnumValues({
  "Apple": Brandname.APPLE,
  "OnePlus": Brandname.ONE_PLUS,
  "Oppo": Brandname.OPPO,
  "Realme": Brandname.REALME,
  "Redmi": Brandname.REDMI,
  "Samsung": Brandname.SAMSUNG,
  "Vivo": Brandname.VIVO
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
