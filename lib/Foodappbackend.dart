import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sf_p/Burger%20models.dart';
import 'package:sf_p/gridviewextent.dart';
import 'dart:io';

import 'upi_india.dart';

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
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,

    home: AuthScreenbackend(price: "",name:"",hotel:""),
  ));
}

class AuthScreenbackend extends StatefulWidget {
  @override
  final String price; // Declare phoneNumber as a class variable
  final String name;
  final String hotel;
  State<AuthScreenbackend> createState() => AuthScreenbackendState();
  const AuthScreenbackend({Key? key,required this.price,required this.name,required this.hotel}) : super(key: key);
}

class AuthScreenbackendState extends State<AuthScreenbackend> {
  void submitorder(
      String name, String phoneNumber, String address, String fooditem) {

    if (name.isEmpty || phoneNumber.isEmpty || address.isEmpty || fooditem.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Please fill all the details',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white
      );   }
    else
      {
   try{
     final database = FirebaseDatabase.instance.ref('$phoneNumber');
     database.child('$name').set({
       'name': "$name",
       'address': "$address",
       'fooditem': "$fooditem",
       'phonenumber': "$phoneNumber",
       'price': "${widget.price}",
       'hotel':"${widget.hotel}",
       'quantity':"$sets",
     });
     Fluttertoast.showToast(
         msg: 'Order Placed',
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
         backgroundColor: Colors.black,
         textColor: Colors.white
     );
   }
   catch(e)
    {
      print("Error occur $e");
    }
      }


      }


  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _fooditemController = TextEditingController();
  final TextEditingController _hotelController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  var sets=1;
  RxInt quantity = 0.obs;
  @override
  Widget build(BuildContext context) {

        return Scaffold(
backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: 820,
          padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _phoneNumberController,
                  decoration: InputDecoration(

                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Phone Number',
                    hintText: 'Enter your phone number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _addressController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Address',
                    hintText: 'Enter your address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _fooditemController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Food Item',
                    hintText: 'Enter your Food item',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _hotelController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Hotel Name',
                    hintText: 'Hotel Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _priceController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Price',
                    hintText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          decease(quantity);
                        },
                        child: Text(
                          '-',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        )),
                    Obx(
                      () => Text(
                        "${quantity.value}",
                        style: TextStyle(fontSize: 30,color: Colors.white),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          increase(quantity);
                        },
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        )),
                  ],
                ),
                Center(
                  child: InkWell(
                    onTap: () {
          
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyAppupi()));
                    },
                    child: RichText(
          
                      text: TextSpan(
                     style: TextStyle(fontSize: 20, color: Colors.blue.shade200),
                        text: 'Online Payment : ',
                        children: [
                          TextSpan(
                            style: TextStyle(fontSize: 20, color: Colors.blue.shade200),
                            text: "UPI"
                          )
          
                        ]
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    setvalues(sets);
                     // Add your desired functionality here
                  },
                  child: Text('Set Values',style: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
          
                    submitorder(_nameController.text.toString(), _phoneNumberController.text.toString(),_addressController.text.toString(), _fooditemController.text.toString());
                    // Add your desired functionality here
                  },
                  child: Text('Submit',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void decease(RxInt quantity) {
    if(quantity.value > 0)
      {
        quantity.value--;
      }

  }

  void increase(RxInt quantity) {
    quantity.value++;
    if(quantity.value>=0)
      {
       quantity.value=quantity.value;
      }
sets=quantity.value;

  }

  void setvalues(int sets) {
    // Set food item and hotel name from widget properties
    _fooditemController.text = widget.name;
    _hotelController.text = widget.hotel;
    _priceController.text = widget.price;
  }


}
