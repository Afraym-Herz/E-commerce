import 'package:e_commerce/core/helper_functions/get_currency.dart';
import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';

class Item {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

  factory Item.fromEntity(CartItemEntity cartItemEntity) => Item(
    name: cartItemEntity.productEntity.productName,
    quantity: cartItemEntity.count,
    price: cartItemEntity.productEntity.productPrice.toString(),
    currency: getCurrency(),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
}
