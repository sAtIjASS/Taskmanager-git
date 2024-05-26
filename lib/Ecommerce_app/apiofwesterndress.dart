// To parse this JSON data, do
//
//     final come = comeFromJson(jsonString);

import 'dart:convert';

List<Come> comeFromJson(String str) => List<Come>.from(json.decode(str).map((x) => Come.fromJson(x)));

String comeToJson(List<Come> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Come {
  Name name;
  String size;
  String description;
  String price;
  String imageUrl;

  Come({
    required this.name,
    required this.size,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Come.fromJson(Map<String, dynamic> json) => Come(
    name: nameValues.map[json["name"]]!,
    size: json["size"],
    description: json["description"],
    price: json["price"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "size": size,
    "description": description,
    "price": price,
    "image_url": imageUrl,
  };
}

enum Name {
  WESTERN_DRESS
}

final nameValues = EnumValues({
  "western dress": Name.WESTERN_DRESS
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
