import 'dart:convert';
class CatalogModel {
  static final catModel= CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel() => catModel;
  static List<Item> items=[];

  // Get Item by ID
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  // Get Item by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
  factory Item.fromMap(Map<String,dynamic> map){
    return Item(
        id:  map["id"],
        name: map["name"],
        image: map["image"],
        desc: map["desc"],
        color: map["color"],
        price: map["price"]
    );
  }
  toMap() =>{
    "id":id,
    "name":name,
    "image":image,
    "desc":desc,
    "color":color,
    "price":price

  };
}