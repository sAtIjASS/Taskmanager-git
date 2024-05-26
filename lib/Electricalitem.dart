import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'Ecommerce_app/Mobileapi.dart';
import 'Ecommerce_app/curvednavigationbar.dart';

RxInt storevalue=0.obs;
class Electricalitemclass extends StatelessWidget{
  List <Welcomessss> dataofmobile = [];
  List<Map<dynamic,dynamic>> mobilelist=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Divider(color: Colors.black),
            SizedBox(height: 10),
            // FutureBuilder and ListView.builder starts from here
            FutureBuilder(
                future: getdata13(),
                builder:(context, snapshot) {
                  if (snapshot.hasData) {
                    return mobiledata(snapshot);
                  }
                  else if(snapshot.connectionState==ConnectionState.waiting)
                  {
                    return Center(child: LinearProgressIndicator());
                  }
                  else
                  {
                    return Center(child: CircularProgressIndicator());
                  }
                }
            )
          ],
        ),
      ),
    );
  }
  //This api is responsible for fetching the data of Mobiles
  Future<List<Welcomessss>> getdata13() async {


    final response = await http.get(
        Uri.parse('https://b9b6e56a-5072-493b-8a1d-9d78d7d63ab0.mock.pstmn.io/mobiles'));

    final save = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      // Iterate through the response data and convert each item to a mobile object
      for (Map<String, dynamic> index in save) {
        dataofmobile.add(Welcomessss.fromJson(index));
      }

      return dataofmobile; // Return the list of mobile objects
    } else {
      return dataofmobile; // Return an empty list in case of an error
    }
  }

  //This function is return mobile list widget
  Widget mobiledata(snapshot) {

    return ListView.builder(
      itemCount: snapshot.data!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(

          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    child: Container(
                      height: 190,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage("${snapshot.data![index].image}"),fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name :- ${snapshot.data![index].name}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        Text("Price :- ${snapshot.data![index].price}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        Text("Brand Name :- ${snapshot.data![index].brandname}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                        InkWell(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return mobilesection(key:GlobalKey(),name:"${dataofmobile[index].name}", image:dataofmobile[index].image,description:dataofmobile[index].description,price:int.parse(dataofmobile[index].price) , brandname: dataofmobile[index].brandname.toString(),setindexvalue:index );
                          }));
                        },child: Text("See Details",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.italic),)),
                      ],
                    ),
                  )

                ],
              ),
            ),
            Divider(color: Colors.black),
          ],
        );
      },
      key: UniqueKey(), // Adding a key for performance
      physics: NeverScrollableScrollPhysics(), // Disable scrolling for the ListView
    );
  }

}


//This  class Responsible for the Mobile section
class mobilesection extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final int  price;
  final String brandname;
  final int setindexvalue;
  mobilesection({Key ? key , required this.name, required this.image, required this.description, required this.price, required this.brandname,  required this.setindexvalue});

  @override
  State<mobilesection> createState() => _mobilesectionState();
}

class _mobilesectionState extends State<mobilesection> {
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
                height: 250,

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

                          if(storevalue.value==0){
                            storevalue.value=1;
                            Get.snackbar("Thanks", "For you Feedback",colorText: Colors.white,backgroundColor: Colors.black,margin: EdgeInsets.all(10),duration: Duration(milliseconds: 1000),);

                            likelist.add({
                              "name":widget.name,
                              "image":widget.image,
                              "price":widget.price,
                            });
                          }
                          else
                          {
                            storevalue.value=0;
                            Get.snackbar("Thanks", "For you Feedback",colorText: Colors.white,backgroundColor: Colors.black,margin: EdgeInsets.all(10),duration: Duration(milliseconds: 1000),);
                          }
                        },
                        child: Obx(()=> Icon(Icons.favorite,color: storevalue.value==0?Colors.blue:Colors.red,))),

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
                "Brand: ${widget.brandname}",
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
                                "model": widget.brandname,
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
void main() {

  runApp(MaterialApp(home: Electricalitemclass(),));
}