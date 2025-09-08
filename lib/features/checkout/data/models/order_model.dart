import 'package:e_commerce/core/helper_functions/get_saved_user_data.dart';
import 'package:e_commerce/features/checkout/data/models/order_product_model.dart';
import 'package:e_commerce/features/checkout/data/models/shipping_address_model.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';

class OrderModel {
  final String uID;
  final bool paypal;
  final double totalPrice;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;

  OrderModel({
    required this.uID,
    required this.paypal,
    required this.totalPrice,
    required this.shippingAddressModel,
    required this.orderProducts,
  });

  factory OrderModel.fromEntity(OrderEntity orderEntity) => OrderModel(
    uID: orderEntity.uID,
    paypal: orderEntity.payWithCash!,
    totalPrice: orderEntity.cartEntity.calcTotalPrice().toDouble(),
    shippingAddressModel: ShippingAddressModel.fromEntity(
      orderEntity.shippingAddressEntity,
    ),
    orderProducts: orderEntity.cartEntity.cartItems
        .map((e) => OrderProductModel.fromCartItemEntity(e))
        .toList(),
  );

  toJson() => {
    'uID': uID,
    'payway': paypal,
    'totalPrice': totalPrice,
    'shippingAddressModel': shippingAddressModel.toJson(),
    'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
  };

  
}
