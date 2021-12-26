import 'package:flutter/material.dart';
import 'package:loginpage/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:loginpage/widgets/themes.dart';
class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Mytheme.creamColor,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding:Vx.mOnly(right: 12),
        children: [
          "\$${catalog.price}".text.bold.xl.make(),
          ElevatedButton(onPressed: (){},
            child: "Buy".text.make(),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Mytheme.darkBluishColor)
            ),
          ).wh(100, 50)
        ],
      ).p32(),
      body: Column(
        children: [
          Hero(
              child: Image.network(catalog.image),
               tag: Key(catalog.id.toString()),
          ),
          Expanded(
              child: VxArc(
                height: 20,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                     children: [
                       catalog.name.text.color(Mytheme.darkBluishColor).lg.bold.make(),
                       catalog.desc.text.make(),
                     ],
                  ).py64(),
                ),
              )
          )
        ],
      ),
    );
  }
}
