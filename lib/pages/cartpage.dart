import 'package:flutter/material.dart';
import 'package:loginpage/models/cart.dart';
import 'package:loginpage/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
// ignore_for_file: prefer_const_constructors
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          Cartlist().p32().expand(),
          Divider(),
          _cartTotal()
        ],
      ),
    );
  }
}
class _cartTotal extends StatelessWidget {

  const _cartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart=Cartmodel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          '\$${_cart.totalPrice}'.text.xl5.color(context.theme.accentColor).make(),
          30.widthBox,
          ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:"Buying not supported".text.make() ));
              }, child: "Buy".text.white.make(),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(context.theme.buttonColor)
            ),
          )
        ],
      ),
    );
  }
}
class Cartlist extends StatefulWidget {
  const Cartlist({Key? key}) : super(key: key);

  @override
  _CartlistState createState() => _CartlistState();
}

class _CartlistState extends State<Cartlist> {
  final _cart=Cartmodel();

  get index => null;
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty?"Cart is empty".text.make():ListView.builder(
        itemBuilder: (context,index) => ListTile(
         leading: Icon(Icons.cloud_done),
          trailing: IconButton(icon: Icon(Icons.remove_circle), onPressed: () {  },),
          title:_cart.items[index].name.text.make()
        ),

      itemCount: _cart.items.length

    );
  }
}
