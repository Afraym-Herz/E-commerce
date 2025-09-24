import 'package:e_commerce/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:e_commerce/features/home/domain/entites/cart_entity.dart';

class OrderInputEntity {
  final String orderId;
  final CartEntity cartEntity;
  bool payWithCash;
  final ShippingAddressEntity shippingAddressEntity = ShippingAddressEntity();

  OrderInputEntity(this.cartEntity, {required this.orderId, this.payWithCash = true});

  double calcTotalPrice() => subtotal() + shippingCost() - shippingDiscount();

  double subtotal() => cartEntity.calcTotalPrice().toDouble();

  double shippingCost() => 30;

  double shippingDiscount() => 0;
  
}
