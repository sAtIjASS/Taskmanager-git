import 'package:liquid_swipe/liquid_swipe.dart';
import '../Orderpage.dart';
import '../Userprofile.dart';
import 'Grocery section.dart';
import'Page4.dart';
import 'package:intl/intl_standalone.dart' if (dart.library.html) 'package:intl/intl_browser.dart';
import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'Kurtipage.dart';
import 'Page3eapp.dart';
import'page2eapp.dart';
import 'package:sf_p/backbutton.dart';
import 'apiofjewellery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'apiofshoes.dart';
import 'dart:io';
import'likelistecommerceapp.dart';
import 'package:http/http.dart' as http;






void main() {
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false, home: const Myecommerceapp()));
}




//This is the another code Starts From here for the Ecommerce App


RxDouble sum=0.0.obs;
RxInt likes=0.obs;
RxList<dynamic> value = [].obs;
RxList<dynamic> likelist = [].obs;
List<Welcome> data = [];

List<Welcomes> data1 = [];
List<Widget> selectcart = [];
RxList<dynamic> shoescart = [].obs;
class Myecommerceapp extends StatefulWidget {
  const Myecommerceapp({Key? key}) : super(key: key);

  @override
  State<Myecommerceapp> createState() => _MyAppState();
}

class _MyAppState extends State<Myecommerceapp> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  Rx<PageController> controller = PageController().obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () =>
            PageView(
              controller: controller.value,
              children: [
                Container(
                  child: AnimatedSwitcherExample(),
                ),
                Container(
                  color: Colors.white,
                  child:
                  page2(context), //This the code for the second pageview in this Ecommerce app
                ),
                Container(
                  child: page3(context),
                ),
                Container(
                  child: MyApppage4(),  //This  the code for the 4th pageview in this Ecommerce app
                )
                ,Container(
                  child:MyApppage5(context),
                )

              ],
            ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, size: 30,semanticLabel: "Home",),
          Icon(Icons.man, size: 30,semanticLabel: "Men",),
          Icon(Icons.woman, size: 30,semanticLabel: "Women",),
          Icon(Icons.call_split, size: 30,semanticLabel: "Men",),
          Icon(Icons.local_grocery_store, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          controller.value.animateToPage(index,
              duration: Duration(seconds: 1), curve: Curves.easeInOut);
        },
        letIndexChange: (index) => true,
      ),
    );
  }


}


//This is code Is responsible for the Page 1
class AnimatedSwitcherExample extends StatefulWidget {
  @override
  _AnimatedSwitcherExampleState createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  RxBool _showFirst = false.obs; // Track which widget to display

  void _toggleWidgets() {
    _showFirst.value = !_showFirst.value;
  }

  @override
  Widget build(BuildContext context) {
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
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade400,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context)=>likelistecommerceapp(value:likelist)));
                },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update UI based on item selection
                Navigator.push(context, MaterialPageRoute(builder: (context)=>  MyApppage5(context)));
              },

            ),



//This is the For Profile Section
            ListTile(
              title: Text('Your Profile'),
              onTap: () {
                // Update UI based on item selection
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAppUser()));
              },

            ),
            //
            // Add more ListTile widgets for additional items
            ElevatedButton(
              onPressed: _toggleWidgets,
              child: Text('Toggle Widgets'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return cart(key: GlobalKey(), value: value);
                }));
              },
              child: Text('See Cart'),
            ),

          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


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
                        color:
                            Colors.grey), // You can customize the border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color:
                            Colors.blue), // You can customize the border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color:
                            Colors.grey), // You can customize the border color
                  ),
                ),
              ),

              //This is the code for the search bar, you can customize it as needed

              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Ecommerce",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "App",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
SizedBox(height: 60,),
              FutureBuilder(
                  future: getdata(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 200, // Set the height of the container
                        child: GridView.builder(
                          scrollDirection: Axis
                              .horizontal, // Set scroll direction to horizontal
                          itemCount: 10, // Number of items in the grid
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns in the grid
                            mainAxisSpacing: 30, // Spacing between rows
                            crossAxisSpacing: 40, // Spacing between columns
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            // Build individual grid items
                            return Center(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return          shoesdetails(key: GlobalKey(),name:data[index].name ,image:data[index].images[0] ,description:data[index].description ,price:data[index].price,model:data[index].model,storeindexvalue: index,);

                                        }));

                                      },
                                      child: Container(
                                        // Set the height of the container
                                        height: 90,
                                        width: 320,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  data[index].images[0]),
                                            )),
                                      ),
                                    ),
                                   ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('Shoes',
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  TyperAnimatedText('Jewellery',
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ],
                isRepeatingAnimation: true,
                totalRepeatCount: 100,
              ),

              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 30,
              ),
              Obx(
                () => AnimatedSwitcher(
                  duration: Duration(milliseconds: 300), // Animation duration
                  child: _showFirst.value
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          key: ValueKey<int>(
                              1), // Unique key for the first widget
                          width: 300,
                          height: 600,
                        )
                      : Container(
                          key: ValueKey<int>(
                              2), // Unique key for the second widget
                          width: 340,
                          height: 600,
                          child: jewellery(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                        ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget jewellery() {
    return FutureBuilder(
        future: getdata1(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  mainAxisSpacing: 20, // Spacing between rows
                  crossAxisSpacing: 30, // Spacing between columns
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: SingleChildScrollView(
                      child: Container(
                        height: 700,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.network(
                              "${data1[index].image}",
                              height: 200,
                              fit: BoxFit.cover,
                            ),

                            // Name
                            Text(
                              "Name: ${data1[index].name}",
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),

                            // Price
                            Text(
                              "Price: ${data1[index].price}",
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),

                            // Material
                            Text(
                              "Material: ${data1[index].material}",
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),

                            // Add to cart button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red.shade200),
                              onPressed: () {
                                // Add your logic for adding to cart here
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => about(
                                      key: GlobalKey(),
                                      price: data1[index].price,
                                      name: data1[index].name,
                                      image: data1[index].image,
                                      description: data1[index].description,
                                      piece: data1[index].piecesAvailable,
                                    ),
                                  ),
                                );
                              },
                              child: Center(
                                child: Text('About it',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                              ),
                            ),

                            // Add to cart button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red.shade200),
                              onPressed: () {
                                // Add your logic for adding to cart here
                                value.add({
                                  "name": data1[index].name,
                                  "price": data1[index].price,
                                  "image": data1[index].image,
                                  "description": data1[index].description,
                                  "piecesAvailable":
                                      data1[index].piecesAvailable,
                                });
                                Get.snackbar("Success", "Item added to cart",
                                    margin: EdgeInsets.all(20),
                                    backgroundColor: Colors.black,
                                    colorText: Colors.white,

                                    snackPosition: SnackPosition.BOTTOM
                                ,duration: Duration(milliseconds: 1000),

                                );
                              },
                              child: Center(
                                child: Text('Add to cart',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  //This api is responsible for fetching the data of Shoes
  Future<List<Welcome>> getdata() async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/14d1c7d8-e860-4578-a0b0-9e0e0ae2ace4'));
    final save = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in save) {
        data.add(Welcome.fromJson(index));
      }
      return data;
    } else {
      return data;
    }
  }

//This api is responsible for fetching the data of Jewellery
  Future<List<Welcomes>> getdata1() async {
    final response = await http.get(Uri.parse(
        "https://d8e1b1f2-9edb-4075-b2e2-72a145d040f6.mock.pstmn.io/jewellery"));
    final save = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in save) {
        data1.add(Welcomes.fromJson(index));
      }
      return data1;
    } else {
      return data1;
    }
  }
}

//This is the code of add to cart button

class cart extends StatefulWidget {
  RxList<dynamic> value = [].obs;
  cart({Key? key, required this.value}) : super(key: key);
  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),

        ),
        body: ListView.builder(

            itemCount: widget.value.length,
            itemBuilder: (context, index) {
              try {
                return Card(
                    elevation: 5,
                    child: Obx(
                      () => Column(
                        children: [

                          ExpansionTile(title: Text("Set Values"),
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //This code is Responsible for the Rearrange according to the Ascending order of price
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black45,
                                    ),
                                    onPressed: () {
                                      // Sort the items in the cart based on their prices
                                      widget.value.sort((a, b) => a["price"].compareTo(b["price"]));

                                      // Update the UI using GetX
                                      Get.forceAppUpdate();
                                    },
                                    child: Text("Low Price",style: TextStyle(fontSize: 12,color: Colors.white),),
                                  ),


                                  //This code is Responsible for the Rearrange according to the Descending order of price
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black45,
                                    ),
                                    onPressed: () {

                                      // Sort the items in the cart based on their prices
                                      widget.value.sort((a, b) => b["price"].compareTo(a["price"]));

                                      // Update the UI using GetX
                                      Get.forceAppUpdate();
                                    },
                                    child: Text("High Price",style: TextStyle(fontSize: 12,color: Colors.white),),
                                  ),

                                ]
                            )
                          ]),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 400,
                            width: double.infinity, // Take full width
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Rounded corners
                              image: DecorationImage(
                                image: NetworkImage("${value[index]["image"]}"),
                                fit: BoxFit.cover, // Cover the entire container
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  12), // Add space between the image and text
                          Text(
                            "${value[index]["name"]}",
                            style: TextStyle(
                              fontSize: 18, // Adjust font size for emphasis
                              fontWeight: FontWeight.bold, // Make the name bold
                            ),
                          ),
                          SizedBox(height: 4), // Add space between elements
                          Text(
                            "Price: ${value[index]["price"]}",
                            style: TextStyle(
                              color: Colors.blue, // Change color for emphasis
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Description: ${value[index]["description"]}",
                            style: TextStyle(
                              fontStyle:
                                  FontStyle.italic, // Italicize description
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Available Pieces: ${value[index]["piecesAvailable"]}",
                            style: TextStyle(
                              color: Colors.green, // Change color for emphasis
                            ),
                          ),
                          SizedBox(
                              height: 8), // Add space between text and button
                          ElevatedButton.icon(
                            onPressed: () {

                                widget.value.removeAt(index);
                              Get.forceAppUpdate();
                            },
                            icon: Icon(Icons.delete),
                            label: Text("Remove"),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20), // Rounded button
                              ),
                            ),
                          ),                             ],
                      ),
                    ));
              } catch (e) {
                // Extract data from the list safely using a null check
                final itemData = widget.value[index];
                if (itemData == null) {
                  // Handle the case where an item is missing from the list
                  return Center(
                      child: Text('Error: Item at index $index is null'));
                }
                else
                  {
                    return Text("No item in Cart Please Select Item First");
                  }
              }
            }));
  }
}



//About it class is responsible for showing the information about the product

class about extends StatefulWidget {
  final int price;
  final String name;
  final String description;
  final int piece;
  var image;
  about(
      {Key? key,
      required this.price,
      required this.name,
      required this.description,
      required this.image,
      required this.piece})
      : super(key: key);
  @override
  State<about> createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('About the Item '),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network("${widget.image}"),
            SizedBox(
              height: 23,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "Name: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontStyle: FontStyle.italic),
                            children: [
                          TextSpan(
                              text: "${widget.name}",
                              style: TextStyle(color: Colors.blue, fontSize: 20))
                        ])),
                    SizedBox(width: 10,),
                    InkWell(
                        onTap: (){
                          likelist.add({
                            "name":widget.name,
                            "image":widget.image,
                            "price":widget.price,
                          });
                          Get.snackbar("Thanks", "For you Feedback",colorText: Colors.white,backgroundColor: Colors.black,margin: EdgeInsets.all(10),duration: Duration(milliseconds: 1000),);

                        },
                        child: Icon(Icons.favorite, color: Colors.red, size: 30)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: RichText(
                  text: TextSpan(
                      text: "Price: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontStyle: FontStyle.italic),
                      children: [
                    TextSpan(
                        text: "Rupees ",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    TextSpan(
                        text: "${widget.price}",
                        style: TextStyle(color: Colors.blue, fontSize: 20))
                  ])),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: RichText(
                  text: TextSpan(
                      text: "Pieces Available in Stock :- ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontFamily: 'RobotoMono',
                          fontStyle: FontStyle.italic),
                      children: [
                    TextSpan(
                        text: "${widget.piece}",
                        style: TextStyle(
                            color: Colors.blue.shade300, fontSize: 20))
                  ])),
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: ExpansionTile(
                title: Text("Description",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontStyle: FontStyle.italic)),
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Description:- ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'RobotoMono',
                              fontStyle: FontStyle.italic),
                          children: [
                        TextSpan(
                            text: "${widget.description}",
                            style: TextStyle(color: Colors.black, fontSize: 20))
                      ])),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
                     ],
        ),
      ),
    );
  }
}



//This is responsible for showing the details of the shoes and also for all the Items in the E-commerce App

class shoesdetails extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final int price;
  final String model;
  final int storeindexvalue;

  shoesdetails({
    Key? key,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.model,
    required this.storeindexvalue,
  }) : super(key: key);

  @override
  State<shoesdetails> createState() => _shoesDetailsState();
}

class _shoesDetailsState extends State<shoesdetails> {
  RxList<int> shoeslike = [0,0,0,0,0,0,0,0,0,0].obs;
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
                height: 200,

                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.cover,
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
                          if(shoeslike[widget.storeindexvalue]==0){
                            shoeslike[widget.storeindexvalue]=1;
                            Get.snackbar("Thanks", "For you Feedback",colorText: Colors.white,backgroundColor: Colors.black,margin: EdgeInsets.all(10),duration: Duration(milliseconds: 1000),);

                             likelist.add({
                               "name":widget.name,
                               "image":widget.image,
                               "price":widget.price,
                             });
                          }
                          else
                            {
                              shoeslike[widget.storeindexvalue]=0;
                              Get.snackbar("Thanks", "For you Feedback",colorText: Colors.white,backgroundColor: Colors.black,margin: EdgeInsets.all(10),duration: Duration(milliseconds: 1000),);
                            }
                        },
                        child: Obx(()=> Icon(Icons.favorite,color: shoeslike[widget.storeindexvalue]==0?Colors.blue:Colors.red,))),

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
                "Model: ${widget.model}",
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
                        "model": widget.model,
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



//This is Responsible to show the cart
class shoescartdetails extends StatelessWidget {
  RxList<dynamic> value=[].obs;
  @override
  shoescartdetails({super.key, required this.value});
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Cart"),

      ),
      body: ListView.builder(
        itemCount: value.length,
        itemBuilder: (context, index) {
          try {
            return Card(
                elevation: 5,
                child: Obx(
                      () => Column(
                    children: [

                      ExpansionTile(title: Text("Set Values",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //This code is Responsible for the Rearrange according to the Ascending order of price
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                    ),
                                    onPressed: () {
                                      // Sort the items in the cart based on their prices
                                       value.sort((a, b) => a["price"].compareTo(b["price"]));

                                      // Update the UI using GetX
                                      Get.forceAppUpdate();
                                    },
                                    child: Text("Low Price",style: TextStyle(fontSize: 12,color: Colors.white),),
                                  ),


                                  //This code is Responsible for the Rearrange according to the Descending order of price
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                    ),
                                    onPressed: () {

                                      // Sort the items in the cart based on their prices
                                      value.sort((a, b) => b["price"].compareTo(a["price"]));

                                      // Update the UI using GetX
                                      Get.forceAppUpdate();
                                    },
                                    child: Text("High Price",style: TextStyle(fontSize: 12,color: Colors.white),),
                                  ),

                                ]
                            )
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,
                        width: double.infinity, // Take full width
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              15.0), // Rounded corners
                          image: DecorationImage(
                            image: NetworkImage("${value[index]["image"]}"),
                            fit: BoxFit.cover, // Cover the entire container
                          ),
                        ),
                      ),
                      SizedBox(
                          height:
                          12), // Add space between the image and text
                      Text(
                        "${value[index]["name"]}",
                        style: TextStyle(
                          fontSize: 18, // Adjust font size for emphasis
                          fontWeight: FontWeight.bold, // Make the name bold
                        ),
                      ),
                      SizedBox(height: 4), // Add space between elements
                      Text(
                        "Price: ${value[index]["price"]}",
                        style: TextStyle(
                          color: Colors.blue, // Change color for emphasis
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Description: ${value[index]["description"]}",
                        style: TextStyle(
                          fontStyle:
                          FontStyle.italic, // Italicize description
                        ),
                      ),
                      SizedBox(
                          height: 8), // Add space between text and button
                      Center(
                        child: Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                value.removeAt(index);
                                Get.forceAppUpdate();
                              },
                              icon: Icon(Icons.delete),
                              label: Text("Remove"),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(20), // Rounded button
                                ),
                              ),
                            ),


                            SizedBox(
                              width: 18,
                            ), ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>userorder(key:GlobalKey() ,name: "${value[index]["name"]}",image: "${value[index]["image"]}",price: "${value[index]["price"]}",description: "${value[index]["description"]}",index: index)));
                              },
                              icon: Icon(Icons.shopping_cart),
                              label: Text("Order"),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(20), // Rounded button
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ));
          } catch (e) {
            // Extract data from the list safely using a null check
            final itemData = value[index];
            if (itemData == null) {
              // Handle the case where an item is missing from the list
              return Center(
                  child: Text('Error: Item at index $index is null'));
            }
            else
            {
              return Text("No item in Cart Please Select Item First");
            }
          }

        },
      )


    );
  }
}


























































































































































































































































































