import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'item.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});

  factory ItemList.fromEntity(OrderInputEntity entity)  {
  return ItemList(
    items: entity.cartEntity.cartItems.map((e) => Item.fromEntity(e)).toList(),
  );}

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
