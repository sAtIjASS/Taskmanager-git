


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sf_p/cartlistbloc.dart';
import 'fooditem.dart';

void main() {
  runApp(FoodDeliveryAppEntry());
}

class FoodDeliveryAppEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: BlocProvider(
          blocs: [
            Bloc((i) => CartListBloc()),
          ],
          dependencies: [],
          child: Home(),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              FirstHalf(),
              SizedBox(height: 45),
              for (var foodItem in fooditemList.foodItems)
                Builder(
                  builder: (context) {
                    return ItemContainer(fooditem: foodItem);
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemContainer extends StatelessWidget {
  final FoodItem fooditem;
  ItemContainer({
    required this.fooditem,
  });
  final CartListBloc Bloc = BlocProvider.getBloc<CartListBloc>();
  addToCart(FoodItem fooditem) {
    Bloc.addToList(fooditem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(fooditem);
        Get.snackbar(
          "${fooditem.title} added to cart",
          " at ${fooditem.price} ",
        );
      },
      child: Items(
        hotel: fooditem.hotel,
        itemName: fooditem.title,
        itemPrice: fooditem.price,
        imgUrl: fooditem.imgurl,
        leftAligned: (fooditem.id % 2 == 0) ? true : false,
      ),
    );
  }
}

//It is the class of Items Container

class Items extends StatelessWidget {
  Items({
    required this.leftAligned,
    required this.imgUrl,
    required this.itemName,
    required this.hotel,
    required this.itemPrice,
  });
  final bool leftAligned;
  final String imgUrl;
  final String itemName;
  final String hotel;
  final double itemPrice;

  @override
  Widget build(BuildContext context) {
    double containerPadding = 45;
    double containerBorderRadius = 10;
    return Column(children: <Widget>[
      Container(
          padding: EdgeInsets.only(
            left: leftAligned ? 0 : containerPadding,
            right: leftAligned ? containerPadding : 0,
          ),
          child: Column(children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(

                borderRadius: BorderRadius.horizontal(
                  left: leftAligned
                      ? Radius.circular(0)
                      : Radius.circular(containerBorderRadius),
                  right: leftAligned
                      ? Radius.circular(containerBorderRadius)
                      : Radius.circular(0),
                ),
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(
                left: leftAligned ? 20 : 0,
                right: leftAligned ? 0 : 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            itemName,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          )),
                      Text(
                        '\$$itemPrice',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black45, fontSize: 15),
                          children: [
                           const TextSpan(text: "by "),
                            TextSpan(
                                text: hotel,
                                style: TextStyle(fontWeight: FontWeight.w700))
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: containerPadding,
                  )
                ],
              ),
            )
          ]))
    ]);
  }
}

//It is the code FirstHalf
class FirstHalf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(35, 29, 0, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          SizedBox(
            height: 30,
          ),
          title(),
          SizedBox(
            height: 30,
          ),
          searchbar(),
          SizedBox(
            height: 45,
          ),
          categories(),
        ],
      ),
    );
  }



  //This Function is Responsible for the Categories of the FoodApp WITH ROW
  Widget categories() {
    return Container(
      height: 185,

      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Burgers",
            availability: 12,
            selected: true,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Burgers",
            availability: 12,
            selected: false,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Pizza",
            availability: 12,
            selected: true,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Rolls",
            availability: 12,
            selected: true,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Burgers",
            availability: 12,
            selected: false,
          )
        ],
      ),
    );
  }

  Widget searchbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.search,
          color: Colors.blue,
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search for food or restaurant",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  hintStyle: TextStyle(color: Colors.black87)),
            ))
      ],
    );
  }

  Widget title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 45,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Food",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(
            "Delivery",
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 30),
          ),
        ]),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu),
          StreamBuilder(
              stream: bloc.listStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<FoodItem>? foodItems = snapshot.data;
                  int length = foodItems != null ? foodItems.length : 0;
                  return buildGestureDetector(length, context, foodItems);
                }
                else
                {
                  return buildGestureDetector(0, context, null);
                }
              })
        ],
      ),
    );
  }

  GestureDetector buildGestureDetector(
      int length, BuildContext context, List<FoodItem>? foodItems) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 30),
        child: Text("${length.toString()}",style: TextStyle(color: Colors.white),),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.yellow[800]),
      ),
    );
  }
}



class CategoryListItem extends StatelessWidget {
  CategoryListItem({
    required this.categoryIcon,
    required this.categoryName,
    required this.availability,
    required this.selected,
  });
  final IconData categoryIcon;
  final String categoryName;
  final int availability;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: selected ? Colors.yellow[800] : Colors.white,
          border: Border.all(
              color: selected ? Colors.transparent : Colors.grey.shade200,
              width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 15,
              offset: Offset(25, 0),
              spreadRadius: 5,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                  color: selected ? Colors.transparent : Colors.grey.shade200,
                  width: 1),
            ),
            child: Icon(
              categoryIcon,
              color: Colors.black,
              size: 25,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            categoryName,
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            width: 1.5,
            height: 18,
            color: Colors.black,
          ),
          Text(
            availability.toString(),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
