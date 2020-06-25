import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cartshoping/AppCartTow/Model_Item.dart';


class Control_Cart with ChangeNotifier{

  List<Model_Item> item_Cart = [];
  double price = 0.0;
  int priceItem = 1;
  bool active = false;



  //==================================== اضافة كمية علي المنتج =======
  void addNumber(Model_Item item){
    if(item.requiredQuantity<item.quantity)
    {
      item.requiredQuantity ++;
    }
    notifyListeners();
  }


  //=================================== تنقص من كمية المنتج  ========
  void removNumber(Model_Item item){
    if(item.requiredQuantity>1)
    {
      item.requiredQuantity --;
    }
    notifyListeners();
  }



  //================================== هنا يقوم بارجاع  =========
  bool isActive(bool activep){
    active = activep;
  }


  //==Add Item To Basket=============================
  void addItem(Model_Item item){
    item_Cart.add(item);
    notifyListeners();
    price += item.price;
  }


  //==Remove Item From Basket=============================
  void removItem(Model_Item item){
    item_Cart.remove(item);
    item.requiredQuantity = 1;
    notifyListeners();
    price -= item.price;
  }


  //==Remove All Item From Basket=============================
  void removallItems(){
    item_Cart.clear();
    price = 0.0;
    active =false;
    notifyListeners();
  }


  //==Get Total Price Basket=============================
  double get Price_Cart{
    return price;
  }


  //== Number of products in Basket=============================
  int get countItem{
    return item_Cart.length;
  }


  //== return List item Basket=============================
  List<Model_Item> get ItemBasket{
    return item_Cart;
  }


}