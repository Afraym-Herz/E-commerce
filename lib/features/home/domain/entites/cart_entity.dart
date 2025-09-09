import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;
  CartEntity({required this.cartItems});

  addCartItemEntity(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  removeCartItemEntity(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }

  bool productExists(ProductEntity productEntity) {
    for (CartItemEntity cartItemEntity in cartItems) {
      if (cartItemEntity.productEntity.productName ==
          productEntity.productName) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity productEntity) {
    for (CartItemEntity cartItemEntity in cartItems) {
      if (productEntity == cartItemEntity.productEntity) {
        return cartItemEntity;
      }
    }
    return CartItemEntity(productEntity: productEntity);
  }

  int calcTotalPrice() {
    int totalPrice = 0;

    for (CartItemEntity cartItemEntity in cartItems) {
      totalPrice += cartItemEntity.calcTotalPriceItem();
    }

    return totalPrice;
  }
}
