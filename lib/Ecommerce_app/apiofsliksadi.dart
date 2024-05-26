// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<sliksadi> welcomeFromJson(String str) => List<sliksadi>.from(json.decode(str).map((x) => sliksadi.fromJson(x)));

String welcomeToJson(List<sliksadi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class sliksadi{
  Name name;
  int price;
  String description;
  String imageUrl;

  sliksadi({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  factory sliksadi.fromJson(Map<String, dynamic> json) => sliksadi(
    name: nameValues.map[json["name"]]!,
    price: json["price"],
    description: json["description"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "price": price,
    "description": description,
    "image_url": imageUrl,
  };
}

enum Name {
  SLIK_SADI
}

final nameValues = EnumValues({
  "Slik Sadi": Name.SLIK_SADI
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
