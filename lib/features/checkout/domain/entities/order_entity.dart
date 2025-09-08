import 'package:e_commerce/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:e_commerce/features/home/domain/entites/cart_entity.dart';

class OrderEntity {
  final String uID ;
  final CartEntity cartEntity;
   bool? payWithCash ;
   final ShippingAddressEntity shippingAddressEntity = ShippingAddressEntity() ;

  OrderEntity(this.cartEntity, { required this.uID , this.payWithCash});
}