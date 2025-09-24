import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  factory DetailsEntity.fromEntity(OrderInputEntity orderEntity) => DetailsEntity(
    subtotal: orderEntity.subtotal().toString(),
    shipping: orderEntity.shippingCost().toString(),
    shippingDiscount: orderEntity.shippingDiscount().toInt(),
  );

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };
}
