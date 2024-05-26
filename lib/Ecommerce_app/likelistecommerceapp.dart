import'package:flutter/material.dart';
import 'package:get/get.dart';


//This is the class Responsible for the Favourite List of the Ecommerce App
class likelistecommerceapp extends StatelessWidget {
  RxList<dynamic> value = [].obs;

   likelistecommerceapp({Key? key,required this.value}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
          appBar: AppBar(
            title: Text("Like List ",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
            centerTitle: true,
          ),
        body:ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            try {
              return Card(
                  elevation: 5,
                  child: Obx(
                        () => Column(
                      children: [

                        ExpansionTile(title: Text("Set Values",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
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
                        SizedBox(
                            height: 8), // Add space between text and button
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
                        ),                             ],
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



      ),
    );
  }
}