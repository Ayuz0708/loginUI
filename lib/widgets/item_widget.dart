import 'package:flutter/material.dart';
import 'package:loginpage/models/catalog.dart';
//ignore_for_file: prefer_const_constructors
class ItemWidget extends StatelessWidget {

  final Item item;
  const ItemWidget({Key? key, required this.item}) : assert(item!=0) ,super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$ ${item.price}",
        textScaleFactor: 1.3,
        style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,

        ),
        ),

      ),
    );
  }
}
