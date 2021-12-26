import 'package:loginpage/models/catalog.dart';

class Cartmodel{
  static final cartModel= Cartmodel._internal();
  Cartmodel._internal();
  factory Cartmodel() => cartModel;

  late CatalogModel _catalog;

  late final List<int> _itemid =[];

  CatalogModel get catalog =>_catalog;
  set catalog(CatalogModel newcatalog)
  {

    _catalog= newcatalog;
  }
  List<Item> get items => _itemid.map((id) => _catalog.getById(id)).toList();
   num get totalPrice => items.fold(0, (total, current) => total+current.price);

   void add(Item item)
   {
     _itemid.add(item.id);
   }
   void remove(Item item)
   {
     _itemid.remove(item.id);
   }

}
