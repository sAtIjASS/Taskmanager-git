import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'Burger models.dart';
import 'Foodapi.dart';
import 'Foodappbackend.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_navigation/get_navigation.dart';
import 'dart:convert';
import 'Foodappmodel2.dart';
import 'simpledialog box.dart';
void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: app()));
}

List<Welcome> data = [];

class app extends StatefulWidget {
  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> with SingleTickerProviderStateMixin {
  RxInt cartValue = 0.obs;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      drawer:Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
               DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ), //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  accountName: Obx(() =>
                    Text(
                      "$name",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  accountEmail: Obx(()=> Text("$email")),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 165, 255, 137),
                    child: Obx(
                      ()=> Text(
                        "$setfirst",
                        style: TextStyle(fontSize: 30.0, color: Colors.blue),
                      ),
                    ), //Text
                  ), //circleAvatar
                ), //UserAccountDrawerHeader
              ), //DrawerHeader
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(' My Profile '),
                onTap: () {
                setProfile(context);
                },
              ),



              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {

    showDialog(context: context, builder: (context){
    return
    AlertDialog(
    title: Text("Logout"),
    actions: [
    ElevatedButton(onPressed: (){
    Navigator.push(context,MaterialPageRoute(builder: (context){
    return AuthScreenlogout();
    }));
    }, child: Text("Logout"))
    ],
    );
    });// This is the code of the Logout to the app from the profile
                },
              ),
            ],
          ),
        ), //Drawer
      body: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Food Delivery App",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.yellow[800],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Obx(
                      () => Text(
                        cartValue.value.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              title(),
              SizedBox(
                height: 20,
              ),
              searchBar(),
              SizedBox(
                height: 40,
              ),
              Center(
                  child: RichText(
                text: TextSpan(
                  text: 'Pizza',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'Topia',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors
                            .purple, // You can customize color for "Blast"
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 30,
              ),
              pizza(cartValue, context),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: RichText(
                text: TextSpan(
                  text: 'Burger',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'Blast',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors
                            .purple, // You can customize color for "Blast"
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 30,
              ),
              burgerSection(context, cartValue),
              Center(
                  child: RichText(
                text: TextSpan(
                  text: 'Dinner',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: ' Section',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors
                            .purple, // You can customize color for "Blast"
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 30,
              ),
              foodapi(cartValue),
              SizedBox(
                height: 40,
              ),
              Center(
                  child: RichText(
                text: TextSpan(
                  text: 'Shakes',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: ' Section',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors
                            .purple, // You can customize color for "Blast"
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 30,
              ),
              shakes(cartValue, context),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }


}

//Burger section Starts from here

Widget burgerSection(BuildContext context, RxInt cartValue) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          height: 470,
          width: 300,
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
                    image: NetworkImage(burger.image1),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: "Price :- ${burger.price1}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "\nBurger Name:- ${burger.name1}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "\nHotel Name:- ${burger.hotel1}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "\nQuantity:- ${burger.quantity1}",
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthScreenbackend(
                                key: GlobalKey(),
                                price: burger.price1,
                                name: burger.name1,
                                hotel: burger.hotel1),
                          ));
                      // Add your onPressed logic here
                    },
                    style: ButtonStyle(
                      elevation:
                          MaterialStateProperty.all<double>(5), // Elevation
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white), // Background color
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(25), // Button border radius
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10), // Button padding
                      ),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(
                            fontSize: 16, color: Colors.white), // Text style
                      ),
                    ),
                    child: Text('Order Now'), // Button text
                  ),
                  TextButton(
                      onPressed: () {
                        if (burger.islike1.value == 0) {
                          cartValue.value++;
                          burger.islike1.value++;

                          Fluttertoast.showToast(
                              msg: "Thanks For Feedback",
                              gravity: ToastGravity.BOTTOM);
                        } else {
                          cartValue.value--;

                          burger.islike1.value--;
                          Fluttertoast.showToast(
                              msg: "Thanks For Feedback",
                              gravity: ToastGravity.BOTTOM);
                        }
                      },
                      child: Obx(
                        () => Icon(Icons.favorite,
                            color: burger.islike1.value == 0
                                ? Colors.blue
                                : Colors.red),
                      )),
                ],
              ),SizedBox(height:20,)
,
              ElevatedButton(  onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => cartvalue(
                        key: GlobalKey(),
                        price: burger.price1,
                        name: burger.name1,
                        hotel: burger.hotel1,
                        image:burger.image1,),
                    ));
              },
                child: Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20.0),
        Container(
          margin: EdgeInsets.all(10.0),
          height: 470,
          width: 300,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(6.0),
                height: 180,
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
                    image: NetworkImage(burger.image2),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: "Price :- ${burger.price2}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "\nBurger Name:- ${burger.name2}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "\nHotel Name:- ${burger.hotel2}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "\nQuantity:- ${burger.quantity2}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AuthScreenbackend(
                                  key: GlobalKey(),
                                  price: burger.price2,
                                  name: burger.name2,
                                  hotel: burger.hotel2),
                            ));
                        // Add your onPressed logic here
                      },
                      style: ButtonStyle(
                        elevation:
                            MaterialStateProperty.all<double>(5), // Elevation
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white), // Background color
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                25), // Button border radius
                          ),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10), // Button padding
                        ),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(
                              fontSize: 16, color: Colors.white), // Text style
                        ),
                      ),
                      child: Text('Order Now'), // Button text
                    ),
                    TextButton(
                        onPressed: () {
                          if (burger.islike2.value == 0) {
                            cartValue.value++;
                            burger.islike2.value++;
                            Fluttertoast.showToast(
                                msg: "Thanks For Feedback",
                                gravity: ToastGravity.BOTTOM);
                          } else {
                            cartValue.value--;
                            burger.islike2.value--;
                            Fluttertoast.showToast(
                                msg: "Thanks For Feedback",
                                gravity: ToastGravity.BOTTOM);
                          }
                        },
                        child: Obx(
                          () => Icon(Icons.favorite,
                              color: burger.islike2.value == 0
                                  ? Colors.blue
                                  : Colors.red),
                        )),
                  ]),
  SizedBox(height:20,),
              ElevatedButton(  onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => cartvalue(
                        key: GlobalKey(),
                        price: burger.price2,
                        name: burger.name2,
                        hotel: burger.hotel2,
                        image:burger.image2,),
                    ));
              },
                child: Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
  ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          height: 470,
          width: 300,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(6.0),
                height: 180,
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
                    image: NetworkImage(burger.image3),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: "Price :- ${burger.price3}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "\nBurger Name:- ${burger.name3}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "\nHotel Name:- ${burger.hotel3}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "\nQuantity:- ${burger.quantity3}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthScreenbackend(
                                key: GlobalKey(),
                                price: burger.price3,
                                name: burger.name3,
                                hotel: burger.hotel3),
                          ));
                      // Add your onPressed logic here
                    },
                    style: ButtonStyle(
                      elevation:
                          MaterialStateProperty.all<double>(5), // Elevation
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white), // Background color
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(25), // Button border radius
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10), // Button padding
                      ),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(
                            fontSize: 16, color: Colors.white), // Text style
                      ),
                    ),
                    child: Text('Order Now'), // Button text
                  ),
                  TextButton(
                      onPressed: () {
                        if (burger.islike3.value == 0) {
                          cartValue.value++;
                          burger.islike3.value++;
                          Fluttertoast.showToast(
                              msg: "Thanks For Feedback",
                              gravity: ToastGravity.BOTTOM);
                        } else {
                          cartValue.value--;
                          burger.islike3.value--;
                          Fluttertoast.showToast(
                              msg: "Thanks For Feedback",
                              gravity: ToastGravity.BOTTOM);
                        }
                      },
                      child: Obx(
                        () => Icon(Icons.favorite,
                            color: burger.islike3.value == 0
                                ? Colors.blue
                                : Colors.red),
                      )),
                ],
              )
              ,SizedBox(height:20,),
              ElevatedButton(  onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => cartvalue(
                        key: GlobalKey(),
                        price: burger.price3,
                        name: burger.name3,
                        hotel: burger.hotel3,
                        image:burger.image3,),
                    ));
              },
                child: Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20.0),
        Container(
          margin: EdgeInsets.all(10.0),
          height: 470,
          width: 300,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(6.0),
                height: 180,
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
                    image: NetworkImage(burger.image4),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: "Price :- ${burger.price4}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "\nBurger Name:- ${burger.name4}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "\nHotel Name:- ${burger.hotel4}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "\nQuantity:- ${burger.quantity4}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthScreenbackend(
                                key: GlobalKey(),
                                price: burger.price4,
                                name: burger.name4,
                                hotel: burger.hotel4),
                          ));
                      // Add your onPressed logic here
                    },
                    style: ButtonStyle(
                      elevation:
                          MaterialStateProperty.all<double>(5), // Elevation
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white), // Background color
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(25), // Button border radius
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10), // Button padding
                      ),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(
                            fontSize: 14, color: Colors.white), // Text style
                      ),
                    ),
                    child: Text('Order Now'), // Button text
                  ),
                  TextButton(
                      onPressed: () {
                        if (burger.islike4.value == 0) {
                          cartValue.value++;
                          burger.islike4.value++;
                          Get.snackbar("Thanks", "For Feedback");
                          Fluttertoast.showToast(
                              msg: "Thanks For Feedback",
                              gravity: ToastGravity.BOTTOM);
                        } else {
                          cartValue.value--;
                          burger.islike4.value--;
                          Fluttertoast.showToast(
                              msg: "Thanks For Feedback",
                              gravity: ToastGravity.BOTTOM);
                        }
                      },
                      child: Obx(
                        () => Icon(Icons.favorite,
                            color: burger.islike4.value == 0
                                ? Colors.blue
                                : Colors.red),
                      )),
                ],
              )
              ,SizedBox(height:20,),

              ElevatedButton(  onPressed: () {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => cartvalue(
  key: GlobalKey(),
  price: burger.price4,
  name: burger.name4,
  hotel: burger.hotel4,
  image:burger.image4,),
  ));
  },
  child: Text(
  "Add to cart",
  style: TextStyle(color: Colors.blue),
  ),
  ),
            ],
          ),
        ),
      ],
    ),
  );
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

Widget foodapi(cartValue) {
  RxList<int> dinnerlike = [0, 0, 0, 0, 0, 0, 0].obs;
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 400,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: FutureBuilder<List<Welcome>>(
                future: getdataoffood(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: dinnerlike.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FoodItemCard(
                              foodItem: snapshot.data![index],
                            ),
                            InkWell(
                              onTap: () {
                                if (dinnerlike[index] == 0) {
                                  dinnerlike[index] = 1;
                                  cartValue.value++;
                                  print(cartValue.value);
                                } else {
                                  dinnerlike[index] = 0;
                                  cartValue.value--;
                                  print(cartValue.value);
                                }
                                Fluttertoast.showToast(
                                  msg: "Thanks For Feedback",
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_SHORT,
                                );
                              },
                              child: Obx(
                                () => Icon(
                                  Icons.favorite,
                                  color: dinnerlike[index] == 0
                                      ? Colors.blue
                                      : Colors.red,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('No data available'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class FoodItemCard extends StatelessWidget {
  final Welcome foodItem;

  const FoodItemCard({Key? key, required this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 180,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(foodItem.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(foodItem.name),
        Text('Price: ${foodItem.price}'),
        Text('Hotel: ${foodItem.hotel}'),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AuthScreenbackend(
                        key: GlobalKey(),
                        price: foodItem.price,
                        name: foodItem.name,
                        hotel: foodItem.hotel)));
            // Add your onPressed logic here
          },
          style: ElevatedButton.styleFrom(
            elevation: 5, // Elevation
            padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 10), // Button padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Button border radius
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.blue, // Button background color
              borderRadius: BorderRadius.circular(10), // Button border radius
            ),
            child: Container(
              padding: EdgeInsets.all(10), // Inner padding
              child: Text(
                'Order Now', // Button text
                style: TextStyle(
                  fontSize: 18, // Text size
                  color: Colors.white, // Text color
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => cartvalue(
                          key: GlobalKey(),
                          price: foodItem.price,
                          name: foodItem.name,
                          hotel: foodItem.hotel,
                      image: foodItem.image,),
                    ));
              },
              child: Text(
                "Add to cart",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );
  }
}

//It is the api of dinner section
Future<List<Welcome>> getdataoffood() async {
  try {
    final response = await http.get(
        Uri.parse("https://mocki.io/v1/4f5863d6-bdf5-4875-8765-ba568fdd8eed"));
    if (response.statusCode == 200) {
      final save = jsonDecode(response.body.toString());
      for (Map<String, dynamic> index in save) {
        data.add(Welcome.fromJson(index));
      }
      return data;
    } else {
      // Handle non-200 status code
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any other errors that might occur
    throw Exception('Failed to load data: $e');
  }
}

Widget shakes(cartValue, context) {
  List<String> images = [
    'https://i.postimg.cc/xjL1NKRM/backgroundimage.jpg',
    'https://i.postimg.cc/sXqmkk8Q/download.jpg',
    'https://i.postimg.cc/XJHmp1P4/download-1.jpg',
    'https://i.postimg.cc/RF71YWc8/download-2.jpg',
    'https://i.postimg.cc/mgrs2MkY/download-3.jpg'
  ];

  List<Map<String, dynamic>> infoOfShakes = [
    {"price": "\$5.99", "hotel": "The Shake shop", "name": "Chocolate shake"},
    {"price": "\$7.99", "hotel": "The Shake shop", "name": "Fruit shake"},
    {
      "price": "\$8.99",
      "hotel": "The Shake shop",
      "name": "Fruit Milkchocolate shake"
    },
    {"price": "\$6.99", "hotel": "The Shake shop", "name": "Charity shake"},
    {
      "price": "\$2.99",
      "hotel": "The Shake shop",
      "name": "Double Chocolate shake"
    }
  ];
  RxList<int> shakeslike = [0, 0, 0, 0, 0].obs;
  RxBool controller = true.obs;
  int i = 0;
  return CarouselSlider(
    items: images.map((image) {
      return GestureDetector(
        onTap: () {
          controller.value = !controller.value;
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ExpansionTile(
                    title: Obx(() => Text(
                          infoOfShakes[images.indexOf(image)]["name"],
                          style: TextStyle(
                            color:
                                controller.value ? Colors.green : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    backgroundColor: Colors.white,
                    children: [
                      Obx(() => Text(
                            infoOfShakes[images.indexOf(image)]["price"],
                            style: TextStyle(
                              color: controller.value
                                  ? Colors.green
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Obx(() => Text(
                            infoOfShakes[images.indexOf(image)]["hotel"],
                            style: TextStyle(
                              color: controller.value
                                  ? Colors.green
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AuthScreenbackend(
                                    key: GlobalKey(),
                                    price: infoOfShakes[images.indexOf(image)]
                                        ["price"],
                                    name: infoOfShakes[images.indexOf(image)]
                                        ["name"],
                                    hotel: infoOfShakes[images.indexOf(image)]
                                        ["hotel"]);
                              }));
                            },
                            child: Text(
                              "Place Order",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                if (shakeslike[images.indexOf(image)] == 0) {
                                  shakeslike[images.indexOf(image)] = 1;
                                  cartValue.value++;
                                } else {
                                  shakeslike[images.indexOf(image)] = 0;
                                  cartValue.value--;
                                }
                                Fluttertoast.showToast(
                                  msg:"Thanks for feedback",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                );
                              },
                              child: Obx(() => Icon(
                                    Icons.favorite,
                                    color:
                                        shakeslike[images.indexOf(image)] == 0
                                            ? Colors.blue
                                            : Colors.red,
                                  ))),
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(  onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => cartvalue(
                                    key: GlobalKey(),
                                    price: infoOfShakes[images.indexOf(image)]
                                    ["price"],

                                    name: infoOfShakes[images.indexOf(image)]
                                    ["name"],

                                    hotel: infoOfShakes[images.indexOf(image)]
                                    ["hotel"],
                                    image:images[images.indexOf(image)],

                                  ),
                                ));
                          },
                            child: Text(
                              "Add to cart",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ]
                      )
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    }).toList(),
    options: CarouselOptions(
      initialPage: 0,
      enlargeCenterPage: true,
      aspectRatio: 2.0,
      viewportFraction: 0.9,
      enableInfiniteScroll: true,
      autoPlay: true,
      autoPlayAnimationDuration: Duration(milliseconds: 5000),
      autoPlayCurve: Curves.fastOutSlowIn,
      scrollPhysics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      reverse: true,
    ),
  );
}

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  String name;
  String price;
  String hotel;
  String image;

  Welcome({
    required this.name,
    required this.price,
    required this.hotel,
    required this.image,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        name: json["name"],
        price: json["price"],
        hotel: json["hotel"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "hotel": hotel,
        "image": image,
      };
}

List<Welcome> welcomesFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomesToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcomes {
  String name;
  String price;
  String hotel;
  String image;

  Welcomes({
    required this.name,
    required this.price,
    required this.hotel,
    required this.image,
  });

  factory Welcomes.fromJson(Map<String, dynamic> json) => Welcomes(
        name: json["name"],
        price: json["price"],
        hotel: json["hotel"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "hotel": hotel,
        "image": image,
      };
}

Future<List<Welcomes>> fetchPizza() async {
  final response = await http.get(Uri.parse(
      'https://2312f747-6a93-40c0-8d4c-10c7f417f712.mock.pstmn.io/pizza'));
  if (response.statusCode == 200) {
    List<Welcomes> pizzas = [];
    var jsonData = jsonDecode(response.body);
    for (var item in jsonData) {
      pizzas.add(Welcomes.fromJson(item));
    }
    return pizzas;
  } else {
    throw Exception('Failed to load pizzas');
  }
}

RxList<int> pizzalike = [0, 0, 0, 0, 0, 0, 0, 0].obs;
Widget pizza(cartValue, BuildContext context) {
  return FutureBuilder(
    future: fetchPizza(),
    builder: (context, AsyncSnapshot<List<Welcomes>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else {
        return Container(
          width: 440,
          height: 500,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        snapshot.data![index].image,
                        fit: BoxFit.cover,
                        height: 120,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data![index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              snapshot.data![index].hotel,
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Price: ${snapshot.data![index].price}',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AuthScreenbackend(
                                              key: GlobalKey(),
                                              price:
                                                  snapshot.data![index].price,
                                              name: snapshot.data![index].name,
                                              hotel:
                                                  snapshot.data![index].hotel,
                                            )));
                              },
                              child: Text(
                                "Order Now",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                                onTap: () {
                                  if (pizzalike[index] == 0) {
                                    pizzalike[index] = 1;
                                    cartValue.value++;
                                  } else {
                                    pizzalike[index] = 0;
                                    cartValue.value--;
                                  }
                                  Fluttertoast.showToast(
                                      msg: "Thanks For the Feedback",
                                      toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                  );
                                },
                                child: Obx(() => Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Like",
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                        Icon(Icons.favorite,
                                            color: pizzalike[index] == 1
                                                ? Colors.red
                                                : Colors.blue),
                                      ],
                                    ))),
                          ],
                        ),
                      ),
                      ElevatedButton(  onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => cartvalue(
                                key: GlobalKey(),
                                price: snapshot.data![index].price,
                                name: snapshot.data![index].name,
                                hotel: snapshot.data![index].hotel,
                                image:snapshot.data![index].image,),
                            ));
                      },
                        child: Text(
                          "Add to cart",
                          style: TextStyle(color: Colors.blue),
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
  );
}

//This is the Cart value store the Cart of user in this class

class cartvalue extends StatefulWidget {
  final String price;
  final String name;
  final String hotel;
  var  image;
  cartvalue(
      {Key? key, required this.price, required this.name, required this.hotel,required this.image})
      : super(key: key);
  @override
  State<cartvalue> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<cartvalue> {
  List<Map<String, dynamic>> cart = [];
  void insertfooditemincart(
      String name, String price, String hotel, String image) async{

    cart.add({"name": name, "price": price, "hotel": hotel, "image": image});
    final FlutterSecureStorage storage = FlutterSecureStorage();
    storage.write(key: "value", value: cart.toString());
    var store=storage.read(key: "value");
    print(store);
  }
void initState() {
    super.initState();
    insertfooditemincart(widget.name, widget.price, widget.hotel, widget.image);
}  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Food Cart '),
        ),
        body: ListView.builder(itemBuilder: (context, index)
        {

          return Center(
            child: Card(
              elevation: 4,
            child:Center(
              child: Column(
                    children: [
                      Image.network("${cart[index]["image"]}"),
                      SizedBox(height: 20,),
                      Text("${cart[index]["name"]}"),
                      Text("${cart[index]["price"]}"),
                      Text("${cart[index]["hotel"]}"),
                    ]),
            ),
            ),
          );
        },
       itemCount: cart.length, ));
  }

}
