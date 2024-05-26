import 'dart:convert';

import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
void main()
{
  runApp(API_GET());
}
List <Welcome>data=[];
class API_GET extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
   if(snapshot.hasData)
     {
       return ListView.builder(
         itemCount: data.length,
         itemBuilder: (context, index) {
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Container(
               width: 500,
               height: 500,
               color: Colors.green,
               child: Column(
                 children: [
                   Text("${snapshot.data![index].id}"),
                   Text("${snapshot.data![index].company.catchPhrase}"),
                   Text("${snapshot.data![index].company.bs}"),
                   Text("${snapshot.data![index].company.name}"),
                   Text("${snapshot.data![index].name}"),
                   Text("${snapshot.data![index].phone}"),
                   Text("${snapshot.data![index].email}"),
                   Text("${snapshot.data![index].website}"),
                   Text("${snapshot.data![index].address.city}"),
                   Text("${snapshot.data![index].address.street}"),
                   Text("${snapshot.data![index].address.suite}"),
                   Text("${snapshot.data![index].address.zipcode}"),
                   Text("${snapshot.data![index].address.geo.lat}"),
                   Text("${snapshot.data![index].address.geo.lng}"),
                   Text("${snapshot.data![index].username}"),
                 ],
               ),
             ),
           );

         },
       );

     }
   else
     {
       return CircularProgressIndicator();
     }
          },
        ),
      )
    );
  }
}
Future<List<Welcome>> getData()
async
{
  final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  final save=jsonDecode(response.body.toString());
  if(response.statusCode==200)
    {
      for(Map<String,dynamic> index in save)
        {
          data.add(Welcome.fromJson(index) );
        }
      return data;
    }
  else
    {
      return data;
    }
}









// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  Welcome({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    address: Address.fromJson(json["address"]),
    phone: json["phone"],
    website: json["website"],
    company: Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "address": address.toJson(),
    "phone": phone,
    "website": website,
    "company": company.toJson(),
  };
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"],
    suite: json["suite"],
    city: json["city"],
    zipcode: json["zipcode"],
    geo: Geo.fromJson(json["geo"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "suite": suite,
    "city": city,
    "zipcode": zipcode,
    "geo": geo.toJson(),
  };
}

class Geo {
  String lat;
  String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
    lat: json["lat"],
    lng: json["lng"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json["name"],
    catchPhrase: json["catchPhrase"],
    bs: json["bs"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "catchPhrase": catchPhrase,
    "bs": bs,
  };
}
