import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'Foodapp1.dart';
import 'fooditem.dart';
import 'provider.dart';
import'package:flutter/material.dart';

class CartListBloc extends BlocBase{


  CartProvider provider=CartProvider();
  CartListBloc();  //It is the constructor of the class
  var _listController=BehaviorSubject<List<FoodItem>>.seeded([]);
  //output It is responsible for the output
Stream<List<FoodItem>> get listStream=>_listController.stream;

//Input It is responsible for the input
Sink<List<FoodItem>>get listSink=>_listController.sink;


//functions is reposensible for the add to cart and remove from cart
addToList(FoodItem fooditem){
  listSink.add(provider.addToList(fooditem));
}


//functions is reposensible for the add to cart and remove from cart
removeFromList(FoodItem fooditem){
  listSink.add(provider.removeFromList(fooditem));
}

@override
void dispose(){
  _listController.close();
  super.dispose();
}
}