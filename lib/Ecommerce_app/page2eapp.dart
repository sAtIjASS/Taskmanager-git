import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'IndoWesternsection.dart';
import 'Mobilesection.dart';
import 'apiofsliksadi.dart';
import'package:http/http.dart' as http;

import 'curvednavigationbar.dart';
//This is the code Second page of my Ecommerce App
List<men>dataofmen=[];
List<sliksadi>dataofsliksadi=[];
Widget page2(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      centerTitle: true,
      title: RichText(
        text: TextSpan(
          text: 'Ecommerce App',
          style: TextStyle(
            fontSize: 25, // Adjust the font size as needed
            fontWeight: FontWeight.bold, // Adjust the font weight as needed
            color: Colors.white, // Adjust the text color as needed
            fontStyle: FontStyle.italic,
          ),
          children: [
            TextSpan(
              text: ' Flutter',
              style: TextStyle(
                color: Colors.white, // Adjust the text color as needed
              ),
            ),
          ],
        ),
      ),
    ),
    body: SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: 20,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Search',
            hintText: 'Search for products...',
            prefixIcon: Icon(Icons.search),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                // Clear the text field
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: Colors.grey), // You can customize the border color
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: Colors.blue), // You can customize the border color
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: Colors.grey), // You can customize the border color
            ),
          ),
        ), //This is the code for the search bar, you can customize it as needed
        SizedBox(
          height: 20,
        ),

        CarouselSlider(
          items: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://i.postimg.cc/mrvWVqXt/men1.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.purple,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                  )
                ],
                color: Colors.purple,
              ),
              width: 220,
              height: 250,
              child: Center(
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://i.postimg.cc/PqkCc6FF/men1.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.purple,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                  )
                ],
                color: Colors.purple,
              ),
              width: 220,
              height: 250,
              child: Center(

              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return mobile();
                }));

              },
              child: Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://i.postimg.cc/bry91Yh8/men1.png'),
                fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.purple,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                    )
                  ],
                  color: Colors.purple,
                ),
                width: 220,
                height: 250,
                child: Center(
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://i.postimg.cc/NGDt1Nck/download.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.purple,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                  )
                ],
                color: Colors.purple,
              ),
              width: 220,
              height: 250,

            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://ad6b6309-050d-45da-96d2-765152de5d18.mock.pstmn.io/men'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.purple,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                  )
                ],
                color: Colors.purple,
              ),
              width: 220,
              height: 250,

            ),
          ],
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            initialPage: 0,
            autoPlayCurve: Curves.easeInOut,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            onPageChanged: (index, reason) => print(index),
            scrollPhysics: AlwaysScrollableScrollPhysics(),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
          ),
        ),

        SizedBox(
          height: 80,
        ),

        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              ' Men Collections ',
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontStyle: FontStyle.italic,
              ),

            )

          ],
          isRepeatingAnimation: true,
          repeatForever: true,
        ),
        SizedBox(height: 50,),
        FutureBuilder(
          future: getdata11(),
          builder: (context, AsyncSnapshot<List<men>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container(
                width: 500,
                height: 500,
                child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(

                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(6.0),
                              height: 220,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                  )
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(snapshot.data![index].photoUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                                text: "Price :- ${snapshot.data![index].price}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: "\nName: ${snapshot.data![index].name}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\nSize: ${snapshot.data![index].size}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 12,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black
                              ),
                              onPressed: () {
                                // Add your onPressed logic here
                                Navigator.push(context,MaterialPageRoute(builder: (context){
                                  return mensdetails(key: GlobalKey(),name:dataofmen[index].name , image:dataofmen[index].photoUrl,description:dataofmen[index].description,price:dataofmen[index].price , size:dataofmen[index].size,setindexvalue:index );
                                }));
                              },
                              child: Text(
                                "See",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),

        SizedBox(height: 20,),


      ]),),);
}
//This api is responsible for fetching the data of menclothes
Future<List<men>> getdata11() async {
  final response = await http.get(Uri.parse(
      "https://53d10d80-aa46-44d3-9004-75de7a4600e9.mock.pstmn.io/men"));
  final save = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map<String, dynamic> index in save) {
      dataofmen.add(men.fromJson(index));
    }
    return dataofmen;
  } else {
    return dataofmen;
  }
}





//This api is responsible for fetching the data of Slik Sadi
Future<List<sliksadi>> getdata12() async {
  final response = await http.get(Uri.parse(
      "https://8a8b3b7a-ce1c-4c65-bfb5-6c6d53949afa.mock.pstmn.io/sadi"));
  final save = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map<String, dynamic> index in save) {
      dataofsliksadi.add(sliksadi.fromJson(index));
    }
    return dataofsliksadi;
  } else {
    return dataofsliksadi;
  }
}







//This is the model Class for my Men Section Clothes


// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



List<men> welcomeFromJson(String str) => List<men>.from(json.decode(str).map((x) => men.fromJson(x)));

String welcomeToJson(List<men> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class men {
  String name;
  String size;
  int price;
  String description;
  String photoUrl;
  men({
    required this.name,
    required this.size,
    required this.price,
    required this.description,
    required this.photoUrl,
  });

  factory men.fromJson(Map<String, dynamic> json) => men(
    name: json["name"],
    size: json["size"],
    price: json["price"],
    description: json["description"],
    photoUrl: json["photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "size": size,
    "price": price,
    "description": description,
    "photo_url": photoUrl,
  };
}















//This is Responsible for the Men Section Details


class mensdetails extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final int price;
  final String size;
  int setindexvalue;

  mensdetails({
    Key? key,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.size,
    required this.setindexvalue,
  }) : super(key: key);

  @override
  State<mensdetails> createState() => _mensdetailsState();
}

class _mensdetailsState extends State<mensdetails> {
  RxList<int> shoeslike = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the image
            Card(
              elevation: 10,
              child: Container(
                height: 300,

                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            // Display the name
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:InkWell(

                        onTap:(){
                          if(shoeslike[widget.setindexvalue]==0){
                            shoeslike[widget.setindexvalue]=1;
                            Get.snackbar("Thanks", "For you Feedback",colorText: Colors.white,backgroundColor: Colors.black,margin: EdgeInsets.all(10),duration: Duration(milliseconds: 1000),);

                            likelist.add({
                              "name":widget.name,
                              "image":widget.image,
                              "price":widget.price,
                            });
                          }
                          else
                          {
                            shoeslike[widget.setindexvalue]=0;
                            Get.snackbar("Thanks", "For you Feedback",colorText: Colors.white,backgroundColor: Colors.black,margin: EdgeInsets.all(10),duration: Duration(milliseconds: 1000),);
                          }
                        },
                        child: Obx(()=> Icon(Icons.favorite,color: shoeslike[widget.setindexvalue]==0?Colors.blue:Colors.red,))),

                  )
                ],
              ),
            ),
            // Display the price
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Price: Rupees  ${widget.price}",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
            ),
            // Display the model
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Size :-  ${widget.size}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            // Display the description
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Description: ${widget.description}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),

            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(18),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.snackbar("Success", "Item Added to Cart",colorText: Colors.white,backgroundColor: Colors.black,margin: EdgeInsets.all(10),duration: Duration(milliseconds: 1000),);
                          shoescart.add(
                              {
                                "name": widget.name,
                                "image": widget.image,
                                "price": widget.price,
                                "model": widget.size,
                                "description": widget.description,
                              }
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,

                          elevation: 5, // button's elevation when it's pressed
                        ),
                        child: const Text('Add to Cart',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(18),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context){
                            return shoescartdetails(key:GlobalKey(),value: shoescart,);
                          }));

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,

                          elevation: 5, // button's elevation when it's pressed
                        ),
                        child: const Text('See Cart',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],


        ),
      ),
    );
  }
}

