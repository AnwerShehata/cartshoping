import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Control_Cart.dart';
import 'package:cartshoping/AppCartTow/Model_Item.dart';

class Screan_Detlis extends StatelessWidget {
  final Model_Item itemD;
  const Screan_Detlis({Key key, this.itemD}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProvCart = Provider.of<Control_Cart>(context,listen: false);
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        title: Consumer<Control_Cart>(builder: (context, value, child) {
          return Text("${itemD.name}");
        },)
      ),


      body: ListView(
        children: <Widget>[

          //===== Image Item =========================
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(""))
            ),
          ),



          //===== Name And Price  =========================
          Padding(
           padding: const EdgeInsets.all(20),
           child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            new Text("${itemD.name}" , style: TextStyle(fontSize: 20),),
            new Text("${itemD.price}\$" , style: TextStyle(fontSize: 20),),
            ],
          ),
        ),

          new Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                  child: Row(
                    children: <Widget>[
                      new IconButton(
                          icon: Icon(Icons.remove_circle,color: Colors.redAccent),
                          onPressed: (){
                            ProvCart.removNumber(itemD);
                          }
                      ),

                      new Consumer<Control_Cart>(builder: (context, value, child) {
                        return new Text("${itemD.requiredQuantity}",style: TextStyle(fontSize: 18));
                      }),

                      new IconButton(
                          icon: Icon(Icons.add_box,color: Colors.blue),
                          onPressed: (){
                            ProvCart.addNumber(itemD);
                          }
                      ),

                    ],
                  ),
                ),
                new Text("${itemD.quantity}"),
              ],
            ),
          ),
          new Divider(),





        ],
      ),

    );
  }
}
