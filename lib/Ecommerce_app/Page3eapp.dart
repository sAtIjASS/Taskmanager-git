import 'dart:convert';
import 'package:get/get.dart';

import 'IndoWesternsection.dart';
import 'Indowestern.dart';
import 'curvednavigationbar.dart';
import 'kurtiapi.dart';
import'kurtipage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import'package:flutter/material.dart';
import 'package:sf_p/Ecommerce_app/Kurtipage.dart';
import 'package:sf_p/Ecommerce_app/page2eapp.dart';
import 'package:http/http.dart' as http;
import 'apiofsliksadi.dart';
import 'apiofwesterndress.dart';
List <Wel> dataofkurti = [];
RxInt storevalue=0.obs;
int r=500;
List <Indo>Iw = [];
List <Come> dataofwestern=[];
TextEditingController controller1 = TextEditingController();
Widget page3(BuildContext context) {
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

      body:SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller1,
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
        
        
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    ' Women Collections ',
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                    ),
        
                  )
        
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
              SizedBox(height: 30,),
        



              //This Futurebuilder in Responsible for the Women data sending
              FutureBuilder(
                future: getdata12(),
                builder: (context, AsyncSnapshot<List<sliksadi>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Container(
                      width: 500,
                      height: 500,
                      child: ListView.builder(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
        
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(2.0),
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
                                        image: NetworkImage(snapshot.data![index].imageUrl),
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
                                        return mensdetails(key: GlobalKey(),name:"${dataofsliksadi[index].name}", image:dataofsliksadi[index].imageUrl,description:dataofsliksadi[index].description,price:dataofsliksadi[index].price , size:dataofmen[index].size,setindexvalue:index );
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
        

              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Kurti Collections ',
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                    ),

                  )

                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),

              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Divider(thickness: 5, color: Colors.white),
                    SizedBox(height: 10),
                    // FutureBuilder and ListView.builder starts from here
                    FutureBuilder(
                        future: getdata14(),
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





















//This is the code Of Western Collections Section

              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    ' Western Collections ',
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                    ),

                  )

                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
              SizedBox(height: 25,),

              //This Futurebuilder in Responsible for the Western data sending
              FutureBuilder(
                future: getdata15(),
                builder: (context,  AsyncSnapshot<List<Come>> snapshot) {
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
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(2.0),
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
                                        image: NetworkImage(snapshot.data![index].imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  RichText(
                                    text: TextSpan(
                                      text: "Price :- ${index%2==0?900.toString():1000.toString()}",
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
                                        return mensdetails(key: GlobalKey(),name:"${dataofwestern[index].name}", image:dataofwestern[index].imageUrl,description:dataofwestern[index].description,price: index%2==0?900:1000 , size:dataofwestern[index].size,setindexvalue:index );
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






              SizedBox(height: 40,),
              //This is the code of the IndoWestern



              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'IndoWestern Collections ',
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                    ),

                  )

                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),


              SizedBox(height: 50,),







          SingleChildScrollView(
            child: Container(
              height: 700,
              child: FutureBuilder(future: getdata16(), builder: (context,snapshot){
                if(snapshot.hasData){
                  //This is Responsible For the List of Indowestern
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      List<Size> sizes = snapshot.data![index].size;

                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Card(
                                    child: Container(
                                      height: 180,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage("${snapshot.data![index].image}"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Name :- ${snapshot.data![index].name} ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                        index%2==0?Text("Price :- ${snapshot.data![index].price.max}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),):Text("Price :- ${snapshot.data![index].price.min}" , style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                        if (sizes.length >= 5) // Ensure size array has at least 5 elements
                                          Text("Size :- ${sizes[0]}, ${sizes[1]}, ${sizes[2]}, ${sizes[3]}, ${sizes[4]}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),

                                        SizedBox(height: 20,),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context){
                                              return mobilesection(key: GlobalKey(), image: snapshot.data![index].image, description:"An elegant IndoWestern outfit that combines traditional and modern styles." , setindexvalue: index);
                                            }));
                                          },
                                          child: Text("See Details", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20, fontStyle: FontStyle.italic),),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(color: Colors.black),
                          ],
                        ),
                      );
                    },
                    key: UniqueKey(), // Adding a key for performance
                    physics: NeverScrollableScrollPhysics(), // Disable scrolling for the ListView
                  );
                }

                else{
                  return Center(child: CircularProgressIndicator());
                }
              }),
            ),
          )
            ]
        ),
      )
  );

}






//WESTERN DRESS
//This Function is responsible for the data sending of Western Dress

Future<List<Come>> getdata15() async {
  final response = await http.get(Uri.parse(
      "https://bcec14dc-e8fe-45c0-ada7-b43248da3f26.mock.pstmn.io/west"));
  final save = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map<String, dynamic> index in save) {
      dataofwestern.add(Come.fromJson(index));
    }
    return dataofwestern;
  } else {
    return dataofwestern;
  }
}





//Searching Function in the Ecommerce App
void search(TextEditingController controller1) {
  var searchValue = controller1.text.toString().toLowerCase();
  List<dynamic> searchResults = [];

  dataofsliksadi.forEach((element) {
    if (element.name.toString().toLowerCase().contains(searchValue)) {
      searchResults.add(element);
    }
  });


  // Now you have your search results in the searchResults list
  // You can further process or display these results as needed
  for(int i=0;i<searchResults.length;i++){
    print(searchResults[i].name);
  }
}


//This api is responsible for fetching the data of Kurti
Future<List<Wel>> getdata14() async {


  final response = await http.get(
      Uri.parse('https://393ab8eb-1de7-4763-9940-82682214f0eb.mock.pstmn.io/kurti'));

  final save = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    // Iterate through the response data and convert each item to a mobile object
    for (Map<String, dynamic> index in save) {
      dataofkurti.add(Wel.fromJson(index));
    }

    return dataofkurti; // Return the list of mobile objects
  } else {
    return dataofkurti; // Return an empty list in case of an error
  }
}











//This is Responsible For the List of Kurti
Widget mobiledata(snapshot) {
  return ListView.builder(
    itemCount: snapshot.data!.length,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      List<String> sizes = snapshot.data![index].size;

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
                    height: 180,
                    width: 110,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("${snapshot.data![index].image}"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name :- Kurti ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      Text("Price :- $r Rs", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      if (sizes.length >= 5) // Ensure size array has at least 5 elements
                        Text("Size :- ${sizes[0]}, ${sizes[1]}, ${sizes[2]}, ${sizes[3]}, ${sizes[4]}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),

                      SizedBox(height: 20,),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return mobilesection(key: GlobalKey(), image: snapshot.data![index].image, description: snapshot.data![index].description, setindexvalue: index);
                          }));
                        },
                        child: Text("See Details", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20, fontStyle: FontStyle.italic),),
                      ),
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







































//This  class Responsible for the Kurti section
class mobilesection extends StatefulWidget {
  final String image;
  final String description;
  final int setindexvalue;
  mobilesection({Key ? key ,  required this.image, required this.description,    required this.setindexvalue});

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
                      "Kurti",
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
                              "name":"Kurit",
                              "image":widget.image,
                              "price":500,
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
                "Price: Rupees  500",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
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
                                "name": "Kurit",
                                "image": widget.image,
                                "price": 500,
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




//INDOWESTERN DRESS
//This Function is responsible for the data sending of IndoWestern Dress
Future<List<Indo>>getdata16() async {
  final response = await http
      .get(Uri.parse('https://e90116e1-aa46-4ef1-9c1c-792fdd0d4b24.mock.pstmn.io/indo'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map<String, dynamic> index in data) {
      Iw.add(Indo.fromJson(index));
    }
    return Iw;
  } else {
    return Iw;
  }
}