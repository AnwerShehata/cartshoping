import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cartshoping/AppCartTow/Model_Item.dart';
import 'Control_Cart.dart';
import 'package:cartshoping/AppCartTow/Screan_Cart.dart';
import 'package:cartshoping/AppCartTow/Screan_Detlis.dart';


class ScreanHome extends StatefulWidget {
  @override
  _ScreanHomeState createState() => _ScreanHomeState();
}

class _ScreanHomeState extends State<ScreanHome> {

  @override
  Widget build(BuildContext context) {
    final ProvCart = Provider.of<Control_Cart>(context,listen: false);
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        title: Text("Home App"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> Screan_Cart())); }),
          Padding(
            padding: const EdgeInsets.only(top: 20 ,right: 20),
            child: new Consumer<Control_Cart>(builder: (context, cart, child) => Text("${cart.countItem}"),),
          )
        ],
      ),

      
      body: ListView.builder(
        itemCount: Items.length,
          itemBuilder: (context , int index){
            return Card(
              child: Consumer<Control_Cart>(builder: (context, cart, child){
                return ListTile(
                  onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Screan_Detlis(itemD: Items[index],),));
                      Items[index];
                    },

                  trailing: IconButton(icon: Icon(Icons.shopping_basket),
                  onPressed: (){
                    ProvCart.isActive(true);
                    print("${Items[index].name} :${ProvCart.active}");
                    ProvCart.addItem(Items[index]);
                  }),
                  title:Text("${Items[index].name}"),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      new Consumer<Control_Cart>(builder: (context, cart, child) {
                        return Text("price: ${Items[index].price}  quantity :${Items[index].quantity}");
                        },),

                      new Consumer<Control_Cart>(builder: (context, value, child){
                        return  new Visibility(
                            visible: value.active,
                            child: Container(
                              child: Row(
                                children: <Widget>[

                                  new IconButton(
                                      icon: Icon(Icons.remove_circle,color: Colors.redAccent),
                                      onPressed: (){
                                        ProvCart.removNumber(Items[index]);
                                      }
                                  ),

                                  new Text("${Items[index].requiredQuantity}",style: TextStyle(fontSize: 18),),
                                  new IconButton(
                                      icon: Icon(Icons.add_box,color: Colors.blue),
                                      onPressed: (){
                                        ProvCart.addNumber(Items[index]);
                                      }
                                  ),
                                ],
                              ),
                            )
                        );
                      },)
                    ],
                  )
                );
              },),
            );
          }
      ),



    );
  }
}
