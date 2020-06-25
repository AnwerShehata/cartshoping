import 'package:flutter/material.dart';

class Model_Item{
  String name;
  double price;
  int quantity;
  int requiredQuantity;


  Model_Item({this.requiredQuantity,this.name, this.price, this.quantity});
}

List<Model_Item> Items =[ 

  Model_Item(
    name: "Iphine",
    price: 12,
    quantity: 13,             //=====  الكمية المتاحة
    requiredQuantity: 1,      //==== الكمية التي يطلبها العميل
  ),

  Model_Item(
    name: "I Mace",
    price: 850,
    quantity: 10,
    requiredQuantity: 1,
  ),

  Model_Item(
    name: "Phone J7",
    price: 65,
    quantity: 5,
    requiredQuantity: 1,
  ),



];
