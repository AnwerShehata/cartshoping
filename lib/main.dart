import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cartshoping/AppCartTow/ScreanHome.dart';
import 'package:cartshoping/AppCartTow/Control_Cart.dart';


void main(){
  runApp(
    MyApp()
  );
}



class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context){
      return Control_Cart();
    },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreanHome(),
      ),
    );
  }
}

