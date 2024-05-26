import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Electricalitem.dart';










//This is the code of the Grocery Section




List<Dals> dataofdal = [];


  @override
  Widget MyApppage5(BuildContext context) {
    final AnimatedSwitcherControllerss controller = Get.put(AnimatedSwitcherControllerss());

    final PageController pageController = PageController();

    return Scaffold(
        appBar: AppBar(
          title: Text('Grocery Section'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  controller.changeIndex(index);
                },
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index == 1) {
                    // This is for showing the Dal in the E-commerce app section
                    return Container(
                      child: AnimatedSwitcher(
                        duration: Duration(seconds: 1),
                        child: SingleChildScrollView(
                          child: FutureBuilder(
                            future: getdatagrocery(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16.0,
                                    mainAxisSpacing: 16.0,
                                    childAspectRatio: 0.75,
                                  ),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Card(
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: Image.network(
                                                snapshot.data![index].image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            snapshot.data![index].name,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '₹${snapshot.data![index].price}',
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            snapshot.data![index].brandname,
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 10,),
                                          Text("${snapshot.data![index].description}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

                                          SizedBox(height: 20,),
                                          ElevatedButton(onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context){
                                               return mobilesection(key:GlobalKey(),name:"${dataofdal[index].name}", image:dataofdal[index].image,description:dataofdal[index].description,price:dataofdal[index].price, brandname: dataofdal[index].brandname.toString(),setindexvalue:index );
                                            }));
                                          }, child: Text("See Details"))

                                        ],
                                      ),
                                    );
                                  },
                                );
                              }





                              else {
                                return Center(child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                      ),
                    );
                  }



                  //It is another items which is  for showing in the E-commerce app
                  if (index == 2) {
                    // This is for showing the Dal in the E-commerce app section
                    return Container(
                      child: AnimatedSwitcher(
                        duration: Duration(seconds: 1),
                        child: SingleChildScrollView(
                          child: FutureBuilder(
                            future: getdatagrocery(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16.0,
                                    mainAxisSpacing: 16.0,
                                    childAspectRatio: 0.75,
                                  ),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Card(
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: Image.network(
                                                snapshot.data![index].image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            snapshot.data![index].name,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '₹${snapshot.data![index].price}',
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            snapshot.data![index].brandname,
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 10,),
                                          Text("${snapshot.data![index].description}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                        SizedBox(height: 20,),
                                          ElevatedButton(onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context){
                                              return mobilesection(key:GlobalKey(),name:"${dataofdal[index].name}", image:dataofdal[index].image,description:dataofdal[index].description,price:dataofdal[index].price, brandname: dataofdal[index].brandname.toString(),setindexvalue:index );
                                            }));
                                          }, child: Text("See Details"))
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }





                              else {
                                return Center(child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                      ),
                    );
                  }
                  else {
                    return Container(
                      child: AnimatedSwitcher(
                        duration: Duration(seconds: 1),
                        child: Container(
                          key: ValueKey<int>(index),
                          color: controller.selectedIndex.value == index ? Colors.white : Colors.white,
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(fontSize: 24, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
                scrollDirection: Axis.horizontal,
                reverse: true,
                physics: BouncingScrollPhysics(),
                pageSnapping: true,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(10, (index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade400),
                    onPressed: () {
                      controller.changeIndex(index);
                      pageController.jumpToPage(index);
                    },
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(color: Colors.black, fontSize: 12,fontWeight: FontWeight.bold),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
    );
  }







// This is responsible for showing the Grocery section

class AnimatedSwitcherControllerss extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}








// This is the JSON model of the Dal

// To parse this JSON data, do
//
//     final dals = dalsFromJson(jsonString);

List<Dals> dalsFromJson(String str) => List<Dals>.from(json.decode(str).map((x) => Dals.fromJson(x)));

String dalsToJson(List<Dals> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dals {
  String name;
  String description;
  int price;
  String image;
  String brandname;
  String quantity;

  Dals({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.brandname,
    required this.quantity,
  });

  factory Dals.fromJson(Map<String, dynamic> json) => Dals(
    name: json["name"],
    description: json["description"],
    price: json["price"],
    image: json["image"],
    brandname: json["brandname"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "price": price,
    "image": image,
    "brandname": brandname,
    "quantity": quantity,
  };
}


//This is the function of the  api Of dal
Future<List<Dals>> getdatagrocery() async {
  final response = await http.get(Uri.parse('https://749316a2-c5a0-4857-95d1-0d866753cc8e.mock.pstmn.io/dal'));
  final save = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    dataofdal.clear();
    for (Map<String, dynamic> index in save) {
      dataofdal.add(Dals.fromJson(index));
    }
    return dataofdal;
  } else {
    return dataofdal;
  }
}


























































