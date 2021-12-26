import 'package:flutter/material.dart';
import 'package:loginpage/models/cart.dart';
import 'package:loginpage/models/catalog.dart';
import 'package:loginpage/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'home_detail_page.dart';
import 'catalog_image.dart';


class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder:(context,index){
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetailPage(catalog: catalog,))),
            child: CatalogItem(catalog));
      },
      itemCount: CatalogModel.items.length,


    );
  }
}
class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem(this.catalog, {Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: CatalogImage(image: catalog.image)
            
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.color(Mytheme.darkBluishColor).lg.bold.make(),
                catalog.desc.text.make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding:Vx.mOnly(right: 12),
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    _addToCart( catalog: catalog,)
                  ],
                )
              ],
            ))
          ],
        )
    ).white.square(150).roundedLg.make().py(16);
  }
}

class _addToCart extends StatefulWidget {
  final Item catalog;
  const _addToCart({
    Key? key, required this.catalog,
  }) : super(key: key);

  @override
  State<_addToCart> createState() => _addToCartState();
}

class _addToCartState extends State<_addToCart> {
   final _cart= Cartmodel();
  @override
  Widget build(BuildContext context) {
    bool _isInCart;
    if (_cart.items.contains(widget.catalog)) {
      _isInCart = true;
    } else {
      _isInCart = false;
    }
    return ElevatedButton(onPressed: (){
      _isInCart=_isInCart.toggle();
      final _catalog= CatalogModel();
      final _cart=Cartmodel();
      _cart.catalog=_catalog;
      _cart.add(widget.catalog);
      setState(() {

      });
    },
      child:_isInCart?Icon(Icons.done): "Buy".text.make(),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Mytheme.darkBluishColor)
      ),
    );
  }
}