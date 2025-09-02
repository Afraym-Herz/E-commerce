import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;
  CartItemEntity({required this.productEntity, this.count = 1});

  int calcTotalPriceItem() {
    return productEntity.productPrice * count;
  }
  
  void incrementCount()  {count++;}
  void decrementCount()  {count--;}
  
  num calcTotalAmount() => productEntity.unitAmount * count;

  @override
  List<Object?> get props => [productEntity];
  
}