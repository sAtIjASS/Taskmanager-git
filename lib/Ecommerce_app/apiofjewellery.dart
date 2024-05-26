// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcomes> welcomeFromJson(String str) => List<Welcomes>.from(json.decode(str).map((x) => Welcomes.fromJson(x)));

String welcomeToJson(List<Welcomes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcomes{
  int id;
  String name;
  String description;
  Quality quality;
  Material material;
  int price;
  int piecesAvailable;
  String image;

  Welcomes({
    required this.id,
    required this.name,
    required this.description,
    required this.quality,
    required this.material,
    required this.price,
    required this.piecesAvailable,
    required this.image,
  });

  factory Welcomes.fromJson(Map<String, dynamic> json) => Welcomes(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    quality: qualityValues.map[json["quality"]]!,
    material: materialValues.map[json["material"]]!,
    price: json["price"],
    piecesAvailable: json["pieces_available"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "quality": qualityValues.reverse[quality],
    "material": materialValues.reverse[material],
    "price": price,
    "pieces_available": piecesAvailable,
    "image": image,
  };
}

enum Material {
  GOLD,
  PLATINUM,
  SILVER
}

final materialValues = EnumValues({
  "Gold": Material.GOLD,
  "Platinum": Material.PLATINUM,
  "Silver": Material.SILVER
});

enum Quality {
  DIAMOND,
  GOLD,
  SILVER
}

final qualityValues = EnumValues({
  "diamond": Quality.DIAMOND,
  "gold": Quality.GOLD,
  "silver": Quality.SILVER
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
