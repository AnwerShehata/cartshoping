import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Control_Cart.dart';
import 'package:cartshoping/AppCartTow/Model_Item.dart';


class Screan_Cart extends StatefulWidget {
  @override
  _Screan_CartState createState() => _Screan_CartState();
}

class _Screan_CartState extends State<Screan_Cart> {
  @override
  Widget build(BuildContext context) {
    final ProvCart= Provider.of<Control_Cart>(context,listen: false);
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        title: Selector<Control_Cart,int>(
          selector: (context,cart)=> cart.countItem,
          builder: (context, cart, child) => Text("Screan Cart ${cart}"),
        ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.remove), onPressed: (){
              ProvCart.removallItems();
            })
        ],
      ),


      bottomNavigationBar: Container(
        height: 100,
        width: double.infinity,
        color: Colors.amber,
        child: Align(alignment: Alignment.center,
          child: new Selector<Control_Cart,double>(
            builder: (context, TotalPrice, child) => Text("Totel Price: ${TotalPrice}\$" ,style: TextStyle(fontSize: 30),),
            selector: (context,cart) => cart.Price_Cart,
          ),
        )
      ),


      
      body: Consumer<Control_Cart>(builder: (context, cart, child){
        return ListView.builder(
          itemCount: cart.ItemBasket.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                trailing: IconButton(icon: Icon(Icons.delete_sweep), onPressed: (){
                  cart.isActive(false);
                  cart.removItem(cart.ItemBasket[index]);
                }),
                title: Text("${cart.ItemBasket[index].name}"),
                subtitle: Row(children: <Widget>[

                  new Consumer<Control_Cart>(builder: (context, cart, child) {
                    return Text("price: ${cart.ItemBasket[index].price}  quantity :${cart.ItemBasket[index].requiredQuantity}");
                  },),


                  Row(
                    children: <Widget>[

                      new IconButton(
                          icon: Icon(Icons.remove_circle,color: Colors.redAccent),
                          onPressed: (){
                            ProvCart.removNumber(Items[index]);
                          }
                      ),

                      new Consumer<Control_Cart>(builder: (context, cart, child) {
                        return new Text("${cart.ItemBasket[index].requiredQuantity}",style: TextStyle(fontSize: 18),);
                      },),

                      new IconButton(
                          icon: Icon(Icons.add_box,color: Colors.blue),
                          onPressed: (){
                            ProvCart.addNumber(Items[index]);
                          }
                      ),
                    ],
                  ),



                ],)
              ),
            );
        });
      },)

    );
  }
}
