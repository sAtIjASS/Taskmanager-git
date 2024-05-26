import 'Food app 1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'cartlistbloc.dart';
import 'Foodappbackend.dart';
import 'Cart.dart';
import 'themeColor.dart';
import 'fooditem.dart';
import 'listTitleColorBloc.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAcPRw8FyfdFyH1I8A7FXc0-126jhmEQXs',
          appId: '1:766401696299:android:26381addd144730eea906e',
          messagingSenderId: '766401696299',
          projectId: 'firstproject-bfc78'))
      : await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController setpagevalue = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          MainUIFoodApp(),
          MyApps(),
        ],
        onPageChanged: (index) {
          setpagevalue.animateToPage(index,
              duration: Duration(seconds: 5), curve: Curves.bounceIn);
        },
      ),
    );
  }
}

class MainUIFoodApp extends StatefulWidget {
  @override
  State<MainUIFoodApp> createState() => _MainUIFoodAppState();
}

class _MainUIFoodAppState extends State<MainUIFoodApp> {
  RxInt cartValue = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Food Delivery App",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.yellow[800],
                        borderRadius: BorderRadius.circular(50)),
                    child: Obx(() => Text(
                      cartValue.value.toString(),
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              title(),
              SizedBox(
                height: 40,
              ),
              searchBar(),
              SizedBox(
                height: 35,
              ),
              Center(
                  child: Text(
                    "Pizza Section",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 30,
              ),
              pizzasection(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//It is for Searchbar
Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Icon(
        Icons.search,
        color: Colors.black45,
      ),
      SizedBox(width: 20),
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search....",
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            hintStyle: TextStyle(
              color: Colors.black87,
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
    ],
  );
}

//This is for the title
Widget title() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(width: 45),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Food",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
          Text(
            "Delivery",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 30,
            ),
          ),
        ],
      )
    ],
  );
}

//Pizza Section

Widget pizzasection() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SingleChildScrollView(
        child: Container(
          child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 20,
              crossAxisSpacing: 30,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 180,
                        height: 145,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                //color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                              )
                            ],
                            image: DecorationImage(
                                image: NetworkImage(pizza.image1))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${pizza.name1} at \n price  ${pizza.price1}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 180,
                        height: 145,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                //color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                              )
                            ],
                            image: DecorationImage(
                                image: NetworkImage(pizza.image2))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${pizza.name2} at \n price  ${pizza.price2} \n hotel ${pizza.hotel2}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 180,
                        height: 145,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                //color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                              )
                            ],
                            image: DecorationImage(
                                image: NetworkImage(pizza.image3))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Priyanshu satija"),
                        ],
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 180,
                        height: 145,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                //color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                              )
                            ],
                            image: DecorationImage(
                                image: NetworkImage(pizza.image4))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Priyanshu satija"),
                        ],
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 180,
                        height: 145,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                //color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                              )
                            ],
                            image: DecorationImage(
                                image: NetworkImage(pizza.image5))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Priyanshu satija"),
                        ],
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 180,
                        height: 145,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                //color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                              )
                            ],
                            image: DecorationImage(
                                image: NetworkImage(pizza.image6))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Priyanshu satija"),
                        ],
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 180,
                        height: 145,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                //color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                              )
                            ],
                            image: DecorationImage(
                                image: NetworkImage(pizza.image7))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${pizza.name7} \n at price ${pizza.price7}  \n hotel\n ${pizza.hotel7}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 180,
                        height: 145,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                //color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                              )
                            ],
                            image: DecorationImage(
                                image: NetworkImage(pizza.image8))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${pizza.name8} \n at price ${pizza.price8} \n hotel \n ${pizza.hotel8}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ]),
        ),
      ),
    ],
  );
}

//This the backend code of Food Delivery App

class MyApps extends StatefulWidget {
  @override
  State<MyApps> createState() => MyAppsState();
}

class MyAppsState extends State<MyApps> {
  // Create an instance of UserController
// Define variables to store name, phone number, address, hotel, item, and price
  RxString name = ''.obs;
  RxInt phoneNumber = 0.obs;
  RxString address = ''.obs;
  RxString hotel = ''.obs;
  RxString item = ''.obs;
  RxInt price = 0.obs;

  // Method to update name
  void updateName(String value) {
    name.value = value;
  }

  // Method to update phone number
  void updatePhoneNumber(String value) {
    phoneNumber.value = int.parse(value);
  }

  // Method to update address
  void updateAddress(String value) {
    address.value = value;
  }

  // Method to update hotel
  void updateHotel(String value) {
    hotel.value = value;
  }

  // Method to update item
  void updateItem(String value) {
    item.value = value;
  }

  // Method to update price
  void updatePrice(String value) {
    price.value = int.parse(value);
  }

  var quantity = 0.obs;
  var selectedRadio;

  TextEditingController controllername = TextEditingController();

  TextEditingController controlleraddress = TextEditingController();

  TextEditingController controllerphonenumber = TextEditingController();

  TextEditingController controllerhotel = TextEditingController();

  TextEditingController controllerprice = TextEditingController();

  TextEditingController controlleritem = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://i.postimg.cc/mkCPFZPv/foodapp.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Text field for name
                    TextField(
                      controller: controllername,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter your name',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.greenAccent,
                        ), // Icon to   display before the input
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.0), // Rounded border
                          borderSide:
                          BorderSide(color: Colors.blue), // Border color
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.blue), // Border color when enabled
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0), // Border color when focused
                        ),
                      ),
                    ),

                    SizedBox(height: 10.0),
                    // Text field for phone number
                    TextField(
                      controller: controllerphonenumber,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'Enter your Phone number',
                        prefixIcon: Icon(Icons.phone,
                            color: Colors
                                .greenAccent), // Icon to display before the input
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.0), // Rounded border
                          borderSide:
                          BorderSide(color: Colors.blue), // Border color
                        ),
                        filled: true,
                        fillColor: Colors.transparent, // Background color
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.blue), // Border color when enabled
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0), // Border color when focused
                        ),
                      ),
                    ),

                    SizedBox(height: 10.0),
                    // Text field for address
                    TextField(
                      controller: controlleraddress,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        hintText: 'Enter your Address',
                        prefixIcon: Icon(Icons.home,
                            color: Colors
                                .greenAccent), // Icon to display before the input
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.0), // Rounded border
                          borderSide:
                          BorderSide(color: Colors.blue), // Border color
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.blue), // Border color when enabled
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0), // Border color when focused
                        ),
                      ),
                    ),

                    SizedBox(height: 10.0),
                    // Text field for hotel

                    TextField(
                      controller: controllerhotel,
                      decoration: InputDecoration(
                        labelText: 'Hotel Name',
                        hintText: 'Hotel Name',
                        prefixIcon: Icon(Icons.hotel,
                            color: Colors
                                .greenAccent), // Icon to display before the input
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.0), // Rounded border
                          borderSide:
                          BorderSide(color: Colors.blue), // Border color
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.blue), // Border color when enabled
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0), // Border color when focused
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    // Text field for item
                    TextField(
                      controller: controlleritem,
                      decoration: InputDecoration(
                        labelText: 'Item Name',
                        hintText: 'Item Name',
                        prefixIcon: Icon(Icons.production_quantity_limits,
                            color: Colors
                                .greenAccent), // Icon to display before the input
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.0), // Rounded border
                          borderSide:
                          BorderSide(color: Colors.blue), // Border color
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.blue), // Border color when enabled
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0), // Border color when focused
                        ),
                      ),
                    ),

                    SizedBox(height: 10.0),
                    // Text field for price
                    TextField(
                      controller: controllerprice,
                      decoration: InputDecoration(
                        labelText: 'Price',
                        hintText: 'Price of Item',
                        prefixIcon: Icon(Icons.price_change,
                            color: Colors
                                .greenAccent), // Icon to display before the input
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.0), // Rounded border
                          borderSide:
                          BorderSide(color: Colors.blue), // Border color
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              color: Colors.blue), // Border color when enabled
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2.0), // Border color when focused
                        ),
                      ),
                    ),

                    SizedBox(height: 10.0),
//This code is Responsible for the quantity set of the Products

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () {
                              if (quantity.value == 0) {
                              } else {
                                quantity.value--;
                                var totalprice =
                                controllerprice.text.toString();
                                var total =
                                    int.parse(totalprice) * quantity.value;
                                controllerprice.text = total.toString();
                              }
                            },
                            child: Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.greenAccent),
                            )),
                        Obx(() => Text(
                          "${quantity.value}",
                          style: TextStyle(fontSize: 20),
                        )),
                        TextButton(
                            onPressed: () {
                              quantity.value++;
                              var totalprice = controllerprice.text.toString();
                              var total =
                                  int.parse(totalprice) * quantity.value;
                              controllerprice.text = total.toString();
                            },
                            child: Text(
                              "+",
                              style:
                              TextStyle(fontSize: 20, color: Colors.green),
                            )),
                      ],
                    ),
//This is for the payment gateway
                    RadioListTile(
                      title: Text(
                        'Cash Less',
                        style: TextStyle(color: Colors.greenAccent),
                      ), // Display the title for option 1
                      subtitle: Text(
                        " Cash less Payment",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ), // Display a subtitle for option 1
                      value: 'cashless', // Assign a unique value to this option
                      groupValue:
                      selectedRadio, // Use selectedRadio to track the selected option
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value
                              .toString(); // Update selectedRadio when this option is selected
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text(
                        'In Cash',
                        style: TextStyle(color: Colors.greenAccent),
                      ), // Display the title for option 2
                      subtitle: Text(
                        'Cash at home',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ), // Display a subtitle for option 2
                      value: 'cash', // Assign a unique value to this option
                      groupValue:
                      selectedRadio, // Use selectedRadio to track the selected option
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value
                              .toString(); // Update selectedRadio when this option is selected
                        });
                      },
                    ),

                    // Elevated button

                    // Elevated button
                    ElevatedButton(
                        onPressed: () {
                          Get.to(MyApp());
                        },
                        child: Text("Press")),
                    ElevatedButton(
                      onPressed: () {
                        // Update values in UserController with the text from text controllers
                        updateAddress(controlleraddress.text);
                        updateHotel(controllerhotel.text);
                        updateItem(controlleritem.text);
                        updateName(controllername.text);
                        updatePhoneNumber(controllerphonenumber.text);
                        updatePrice(controllerprice.text);

                        if (controlleraddress == "" ||
                            controllerhotel == "" ||
                            controlleritem == "" ||
                            controllername == "" ||
                            controllerphonenumber == "" ||
                            controllerprice == "") {
                          Get.snackbar(
                            "Error",
                            "Please fill all the fields",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                          );
                        } else {
                          // Show snackbar with the actual values
                          Get.snackbar(
                            "Order Placed",
                            "Your order has been placed at ${address.value}.\n"
                                "Hotel: ${hotel.value}\n"
                                "Item: ${item.value}\n"
                                "Price: ${price.value}",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                          );

                          final database =
                          FirebaseDatabase.instance.ref('orders');
                          database
                              .child("${controllerphonenumber.text.toString()}")
                              .set({
                            'name': controllername.text.toString(),
                            'address': controlleraddress.text.toString(),
                            'hotel': controllerhotel.text.toString(),
                            'item': controlleritem.text.toString(),
                            'price': controllerprice.text.toString(),
                            'phonenumber':
                            controllerphonenumber.text.toString(),
                          });
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

