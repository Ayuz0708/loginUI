import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage/utils/routes.dart';
import 'package:loginpage/widgets/drawer.dart';
import 'package:loginpage/models/catalog.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:loginpage/widgets/themes.dart';

import 'catalog_header.dart';
import 'catalog_list.dart';

// ignore_for_file: prefer_const_constructors

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:context.cardColor,
        floatingActionButton: FloatingActionButton(onPressed: ()=> Navigator.pushNamed(context,Myroutes.cartRoute),
        child: Icon(CupertinoIcons.cart),
          backgroundColor: Mytheme.darkBluishColor,

        ),
       body: SafeArea(
         child: Container(
           padding: Vx.m32,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
                CatalogHeader(),
               if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                 CatalogList().expand()
               else
                 CircularProgressIndicator().centered().expand()

             ],
           ),
         ),
       ),
    );
  }
  

  void loadData() async{
    await Future.delayed(Duration(seconds: 2));
     var catalogjson= await rootBundle.loadString("assets/file/catalog.json");
     var decodedjson= jsonDecode(catalogjson);
     var productsdata= decodedjson["products"];
     CatalogModel.items = List.from(productsdata).map<Item>((item) => Item.fromMap(item)).toList();
     setState(() {
       
     });
  }
}
