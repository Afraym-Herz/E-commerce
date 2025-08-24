import 'package:e_commerce/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int count;
  CartItemEntity({required this.productEntity, this.count = 0});

  calcTotalPrice() {
    return productEntity.productPrice * count;
  }
  
  incrementCount() => count++;
  
  decrementCount() => count--;
  
}