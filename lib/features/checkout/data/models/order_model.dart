import 'package:e_commerce/features/checkout/data/models/order_product_model.dart';
import 'package:e_commerce/features/checkout/data/models/shipping_address_model.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final String uID;
  final String orderId;
  final bool paypal;
  final double totalPrice;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
   

  OrderModel({
    required this.uID,
    required this.orderId,
    required this.paypal,
    required this.totalPrice,
    required this.shippingAddressModel,
    required this.orderProducts,
  });

  factory OrderModel.fromEntity(OrderInputEntity orderEntity) => OrderModel(
    uID: orderEntity.orderId,
    orderId: orderEntity.orderId ,
    paypal: orderEntity.payWithCash,
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
    'orderId': orderId ?? 'order is null',
    'payway': paypal,
    'totalPrice': totalPrice,
    'status': 'pending',
    'date': DateTime.now().toString(),
    'shippingAddressModel': shippingAddressModel.toJson(),
    'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
  };
  
}
