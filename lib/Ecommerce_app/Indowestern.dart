// To parse this JSON data, do
//
//     final indo = indoFromJson(jsonString);

import 'dart:convert';

List<Indo> indoFromJson(String str) => List<Indo>.from(json.decode(str).map((x) => Indo.fromJson(x)));

String indoToJson(List<Indo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Indo {
  Name name;
  Price price;
  List<Size> size;
  String image;

  Indo({
    required this.name,
    required this.price,
    required this.size,
    required this.image,
  });

  factory Indo.fromJson(Map<String, dynamic> json) => Indo(
    name: nameValues.map[json["name"]]!,
    price: Price.fromJson(json["price"]),
    size: List<Size>.from(json["size"].map((x) => sizeValues.map[x]!)),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "price": price.toJson(),
    "size": List<dynamic>.from(size.map((x) => sizeValues.reverse[x])),
    "image": image,
  };
}

enum Name {
  INDO_WESTERN,
  INDO_WESTERN_ITEM_8
}

final nameValues = EnumValues({
  "Indo Western": Name.INDO_WESTERN,
  "Indo Western Item 8": Name.INDO_WESTERN_ITEM_8
});

class Price {
  int min;
  int max;

  Price({
    required this.min,
    required this.max,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    min: json["min"],
    max: json["max"],
  );

  Map<String, dynamic> toJson() => {
    "min": min,
    "max": max,
  };
}

enum Size {
  L,
  M,
  S,
  XL,
  XXL
}

final sizeValues = EnumValues({
  "L": Size.L,
  "M": Size.M,
  "S": Size.S,
  "XL": Size.XL,
  "XXL": Size.XXL
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
