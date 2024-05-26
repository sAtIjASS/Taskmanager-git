import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'cartlistbloc.dart';
import 'Foodappbackend.dart';
import 'Cart.dart';
import 'themeColor.dart';
import 'fooditem.dart';
import 'listTitleColorBloc.dart';
import 'dart:io';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAcPRw8FyfdFyH1I8A7FXc0-126jhmEQXs',
          appId: '1:766401696299:android:26381addd144730eea906e',
          messagingSenderId: '766401696299',
          projectId: 'firstproject-bfc78'))
      : await Firebase.initializeApp();
  runApp(setpageview());
}
//This is Responsible for the PageView in the flutter

class setpageview extends StatefulWidget {
  @override
  State<setpageview> createState() => _MyAppState();
}

class _MyAppState extends State<setpageview> {
  PageController setpagevalue=PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          MyApp(),
          MyApps(),

        ],
        onPageChanged: (index){
          setpagevalue.animateToPage(index, duration: Duration(seconds: 5), curve:Curves.bounceIn);
},
      ),
    );
  }
}




//End the pageview class




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return GetMaterialApp(
      title: "Food Delivery",
      home: BlocProvider(
        key: UniqueKey(),
        blocs: [
          Bloc((i) => CartListBloc()),
          Bloc((i) => ColorBloc()),
        ],
        dependencies: const [],
        child:Home(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeContent(),
    );
  }
}


class HomeContent extends StatefulWidget {
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            FirstHalf(),
            SizedBox(height: 45),
            for (var foodItem in fooditemList.foodItems)
              Builder(
                builder: (context) {
                  return ItemContainer(foodItem: foodItem);
                },
              )
          ],
        ),
      ),
    );
  }
}
// Other widget classes remain the same...

class ItemContainer extends StatelessWidget {

  ItemContainer({
    required this.foodItem,
  });

  final FoodItem foodItem;
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();


  addToCart(FoodItem foodItem) {
    bloc.addToList(foodItem);
  }

  removeFromList(FoodItem foodItem) {
    bloc.removeFromList(foodItem);
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(foodItem);
        final snackBar = SnackBar(
          content: Text('${foodItem.title} added to Cart'),
          duration: const Duration(milliseconds: 550),
        );
        Get.snackbar("${foodItem.title} added to Cart", "${foodItem.price}");
      },
      child: Items(
        hotel: foodItem.hotel,
        itemName: foodItem.title,
        itemPrice: foodItem.price,
        imgUrl: foodItem.imgUrl,
        leftAligned: (foodItem.id % 2) == 0 ? true : false,
      ),
    );
  }
}

class FirstHalf extends StatelessWidget {
  const FirstHalf({
    Key ? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 25, 0, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          //you could also use the spacer widget to give uneven distances, i just decided to go with a sizebox
          SizedBox(height: 30),
          title(),
          SizedBox(height: 30),
          searchBar(),
          SizedBox(height: 45),
          categories(),
          SizedBox(height: 45),
          ElevatedButton(onPressed: (){
            Get.to(MyApps());
          }, child: Text("Order Now")),
        ],
      ),
    );
  }
}
Widget categories() {
  return Container(
    height: 185,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Burgers",
          availability: 12,
          selected: true,
        ),
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Pizza",
          availability: 12,
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Rolls",
          availability: 12,
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Burgers",
          availability: 12,
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Burgers",
          availability: 12,
          selected: false,
        ),
      ],
    ),
  );
}

class Items extends StatelessWidget {
  Items({
    required this.leftAligned,
    required this.imgUrl,
    required this.itemName,
    required this.itemPrice,
    required this.hotel,
  });

  final bool leftAligned;
  final String imgUrl;
  final String itemName;
  final double itemPrice;
  final String hotel;

  @override
  Widget build(BuildContext context) {
    double containerPadding = 45;
    double containerBorderRadius = 10;

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: leftAligned ? 0 : containerPadding,
            right: leftAligned ? containerPadding : 0,
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: leftAligned
                        ? const Radius.circular(0)
                        : Radius.circular(containerBorderRadius),
                    right: leftAligned
                        ? Radius.circular(containerBorderRadius)
                        : const Radius.circular(0),
                  ),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const  SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.only(
                    left: leftAligned ? 20 : 0,
                    right: leftAligned ? 0 : 20,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(itemName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  )),
                            ),
                            Text("\$$itemPrice",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                )),
                          ],
                        ),
                        const     SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 15),
                                children: [
                                  TextSpan(text: "by "),
                                  TextSpan(
                                      text: hotel,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700))
                                ]),
                          ),
                        ),
                        SizedBox(height: containerPadding),
                      ])),
            ],
          ),
        )
      ],
    );
  }
}

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    Key? key,
    required this.categoryIcon,
    required this.categoryName,
    required this.availability,
    required this.selected,
  }) : super(key: key);

  final IconData categoryIcon;
  final String categoryName;
  final int availability;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: selected ? Themes.color : Colors.white,
        border: Border.all(
            color: selected ? Colors.black : Colors.grey.shade200,
            width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 15,
            offset:const Offset(15, 0),
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding:const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: selected ? Colors.black : Colors.grey.shade200,
                    width: 1.5)),
            child: Icon(
              categoryIcon,
              color: Colors.black,
              size: 22,
            ),
          ),
          Text(
            categoryName,
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.black, fontSize: 15),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 6, 0, 10),
            width: 1.5,
            height: 15,
            color: Colors.black26,
          ),
          Text(
            availability.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

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
                  borderSide: BorderSide(color: Colors.red))),
        ),
      ),
    ],
  );
}

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

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu),
          StreamBuilder(
            stream: bloc.listStream,
            builder: (context, snapshot) {
              List<FoodItem> foodItems = snapshot.data??[];
              int length = foodItems != null ? foodItems.length : 0;

              return buildGestureDetector(length, context, foodItems);
            },
          )
        ],
      ),
    );
  }

  GestureDetector buildGestureDetector(
      int length, BuildContext context, List<FoodItem> foodItems) {
    return GestureDetector(
      onTap: () {
        if (length > 0) {
        } else {
          return;
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 30),
        child: Text(length.toString()),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.yellow[800], borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}












//This is the code of Second Page





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
                        " Cash less Payment",style: TextStyle(fontWeight: FontWeight.bold),
                      ), // Display a subtitle for option 1
                      value: 'cashless', // Assign a unique value to this option
                      groupValue: selectedRadio, // Use selectedRadio to track the selected option
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value.toString(); // Update selectedRadio when this option is selected
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text(
                        'In Cash',
                        style: TextStyle(color:  Colors.greenAccent),
                      ), // Display the title for option 2
                      subtitle: Text(
                        'Cash at home', style: TextStyle(fontWeight: FontWeight.bold),
                      ), // Display a subtitle for option 2
                      value: 'cash', // Assign a unique value to this option
                      groupValue: selectedRadio, // Use selectedRadio to track the selected option
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value.toString(); // Update selectedRadio when this option is selected
                        });
                      },
                    ),

                    // Elevated button

                    // Elevated button
                    ElevatedButton(onPressed: (){
                      Get.to(MyApp());
                    }, child: Text("Press")),
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
