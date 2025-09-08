import 'package:e_commerce/features/checkout/data/models/order_product_model.dart';
import 'package:e_commerce/features/checkout/data/models/shipping_address_model.dart';

class OrderModel {
  final String uID;
  final String payway;
  final double totalPrice;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;

  OrderModel({
    required this.uID,
    required this.payway,
    required this.totalPrice,
    required this.shippingAddressModel,
    required this.orderProducts,
  });

  toJson() => {
        'uID': uID,
        'payway': payway,
        'totalPrice': totalPrice,
        'shippingAddressModel': shippingAddressModel.toJson(),
        'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      };

}
