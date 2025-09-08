import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';

class OrderProductModel {
  final String productName;
  final String productCode;
  final int productPrice;
  final String imageUrl;
  final int count;

  OrderProductModel({
    required this.productName,
    required this.productCode,
    required this.productPrice,
    required this.imageUrl,
    required this.count,
  });

  factory OrderProductModel.fromCartItemEntity(CartItemEntity cartItemEntity) {
    return OrderProductModel(
      productName: cartItemEntity.productEntity.productName,
      productCode: cartItemEntity.productEntity.productCode,
      productPrice: cartItemEntity.productEntity.productPrice,
      imageUrl: cartItemEntity.productEntity.imageUrl!,
      count: cartItemEntity.count,
    );
  }

  toJson() => {
    'productName': productName,
    'productCode': productCode,
    'productPrice': productPrice,
    'imageUrl': imageUrl,
    'count': count,
  };
}
