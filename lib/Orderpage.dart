import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import'package:provider/provider.dart';

import 'Ecommerce_app/curvednavigationbar.dart';

RxDouble sum=0.0.obs;
RxList<dynamic>likelist=[].obs;
RxList<dynamic> orderlist=[].obs;
class userorder extends StatefulWidget{

  final name;
  final image;
  final int index;
  final description;
  final price;
  userorder({Key? key ,required this.name,required this.image, required this.price ,required this.description,required this.index}) : super(key: key);

  @override
  State<userorder> createState() => userorderState();
}

class userorderState extends State<userorder> {
  @override

  void initState() {
    orderlist.add({
      "name":widget.name,
      "image":widget.image,
      "price":widget.price,
      "description":widget.description,
    });
  }

  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: userorders(),
   );
  }
}





class userorders extends StatefulWidget {
  @override
  State<userorders> createState() => _userorderState();
}
Rx<PageController> controllerofpage = PageController().obs;




//This is the GetxController Code
class OrderController extends GetxController {
// Initialize with some dummy data

// Function to delete an order
  void deleteOrder(int index) {
    orderlist.removeAt(index);
    likelist.removeAt(index);
  }
}

//This is the GetxController Code

class _userorderState extends State<userorders> {
  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Get.put(OrderController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      body:    Obx(
            () =>
            PageView(
              controller: controllerofpage.value,
              children: [
                Container(

child:
Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton.icon(
              onPressed: () {
// Action for ordering

                // Action for processing
                int index =0; // specify the index you want to animate to;
                controllerofpage.value.animateToPage(index,
                    duration: Duration(seconds: 1), curve: Curves.easeInOut);


              },
              icon: Icon(Icons.shopping_cart), // Changed the icon to shopping_cart
              label: Text("Order")
          ),



          ElevatedButton.icon(
            onPressed: () {
              // Action for processing
              int index =1; // specify the index you want to animate to;
              controllerofpage.value.animateToPage(index,
                  duration: Duration(seconds: 1), curve: Curves.easeInOut);
            },
            icon: Icon(Icons.delivery_dining),
            label: Text("Delivered"),
          ),



          ElevatedButton.icon(
              onPressed: () {
// Action for cancellation
                // Action for processing
                int index =3; // specify the index you want to animate to;
                controllerofpage.value.animateToPage(index,
                    duration: Duration(seconds: 1), curve: Curves.easeInOut);

              },
              icon: Icon(Icons.cancel),
              label: Text("Cancellation")
          ),
        ],
      ),
    ),
    SizedBox(height: 20,),
    Expanded(
      child: Obx(
        ()=> ListView.builder(
          itemCount: orderlist.length,
          itemBuilder: (context, index) {
            return
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: 650,
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                         Card(
                           elevation: 5,
                           child: Container(
                             width: 120,

                             decoration: BoxDecoration(
                               image: DecorationImage(
                                 image: NetworkImage(orderlist[index]["image"]),
                               fit: BoxFit.contain,
                               ),
                             ),
                           ),
                         ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          children: [
                            Text(orderlist[index]["name"]),
                            Text(orderlist[index]["price"]),
                            Text(orderlist[index]["description"]),
                            InkWell(onTap: (){
                              if(likelist[index]==0){
                                likelist[index]=1;
                                Get.snackbar("Thanks", "For you Feedback",colorText: Colors.white,backgroundColor: Colors.black,snackPosition: SnackPosition.BOTTOM,margin: EdgeInsets.all(10),duration: Duration(milliseconds: 1000),);

                              }
                              else
                                {
                                  likelist[index]=0;
                                  Get.snackbar("Thanks", "For you Feedback",colorText: Colors.white,backgroundColor: Colors.black,margin: EdgeInsets.all(10),duration: Duration(milliseconds: 1000),snackPosition: SnackPosition.BOTTOM);

                                }
                            },child: function(index)),
                          ],

                        ),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: (){
                                orderController.deleteOrder(index);
                                },
                              child: Icon(Icons.delete,color: Colors.black,size: 40,)),

                        SizedBox(height: 20,),
                          ElevatedButton(onPressed: (){

                            sum.value = 0;
                            for (var item in orderlist) {
                              sum.value += int.parse(item["price"]);
                            }
    showDialog(
    context: context,
    builder: (BuildContext context) {
    return AlertDialog(
    title: Text('Order Placed'),
    content: SingleChildScrollView(
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
      Text('Your order has been placed successfully.'),
      SizedBox(height: 20),
      TextField(
      decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Field 1',
      ),
      ),
      SizedBox(height: 10),
      TextField(
      decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Field 2',
      ),
      ),
      SizedBox(height: 10),
      TextField(
      decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Field 3',
      ),
      ),
      SizedBox(height: 20),
      Obx(() => Text("Total Amount: \$${sum.value}")),
      ],
      ),
    ),
    actions: <Widget>[
    TextButton(
    child: Text('OK'),
    onPressed: () {
    Navigator.of(context).pop();
    sum.value = 0;
    },
    ),
    ],
    );

    },
    );
                    },
                              child: Text("Place Order")
                      ),
                    ],
                  ),
                ],)
              ));
          },
        ),
      ),
    )
  ],
)
                  ,


                ),


                //It is Second Page
                Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton.icon(
                            onPressed: () {
                    // Action for ordering

                              // Action for processing
                              int index =0; // specify the index you want to animate to;
                              controllerofpage.value.animateToPage(index,
                                  duration: Duration(seconds: 1), curve: Curves.easeInOut);


                            },
                            icon: Icon(Icons.shopping_cart), // Changed the icon to shopping_cart
                            label: Text("Order")
                        ),



                        ElevatedButton.icon(
                          onPressed: () {
                            // Action for processing
                            int index =1; // specify the index you want to animate to;
                            controllerofpage.value.animateToPage(index,
                                duration: Duration(seconds: 1), curve: Curves.easeInOut);
                          },
                          icon: Icon(Icons.delivery_dining),
                          label: Text("Delivered"),
                        ),



                        ElevatedButton.icon(
                            onPressed: () {
                    // Action for cancellation
                              // Action for processing
                              int index =3; // specify the index you want to animate to;
                              controllerofpage.value.animateToPage(index,
                                  duration: Duration(seconds: 1), curve: Curves.easeInOut);

                            },
                            icon: Icon(Icons.cancel),
                            label: Text("Cancellation")
                        ),
                      ],
                    ),
                  ),
                ),

                //It is Third Page
                Container(
                 child: SingleChildScrollView(
               scrollDirection: Axis.horizontal,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       ElevatedButton.icon(
                           onPressed: () {
                   // Action for ordering

                             // Action for processing
                             int index =0; // specify the index you want to animate to;
                             controllerofpage.value.animateToPage(index,
                                 duration: Duration(seconds: 1), curve: Curves.easeInOut);


                           },
                           icon: Icon(Icons.shopping_cart), // Changed the icon to shopping_cart
                           label: Text("Order")
                       ),



                       ElevatedButton.icon(
                         onPressed: () {
                           // Action for processing
                           int index =1; // specify the index you want to animate to;
                           controllerofpage.value.animateToPage(index,
                               duration: Duration(seconds: 1), curve: Curves.easeInOut);
                         },
                         icon: Icon(Icons.delivery_dining),
                         label: Text("Delivered"),
                       ),



                       ElevatedButton.icon(
                           onPressed: () {
                   // Action for cancellation
                             // Action for processing
                             int index =3; // specify the index you want to animate to;
                             controllerofpage.value.animateToPage(index,
                                 duration: Duration(seconds: 1), curve: Curves.easeInOut);

                           },
                           icon: Icon(Icons.cancel),
                           label: Text("Cancellation")
                       ),
                     ],
                   ),
                 ),
                ),
                ],
            ),
      ),);
  }

  //It is logical concept of the like and dislike
  //It is control the Logic of the Widget like and dislike
 Widget function(int index) {
    if(index!=-1){
      likelist.insert(index, 0);
    }
    return Obx(()=> Icon(Icons.favorite,color: likelist[index]==0?Colors.blue:Colors.red,size: 35,));
  }
}


















