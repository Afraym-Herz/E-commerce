import 'dart:developer';

import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/features/home/domain/entites/cart_entity.dart';
import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(cartItems: []);

  void addProductToCart(ProductEntity productEntity) {
    bool isProductExists = cartEntity.productExists(productEntity);
    if (isProductExists) {
      cartEntity.getCartItem(productEntity).incrementCount();
      log('is count ${cartEntity.getCartItem(productEntity).count}');
    } else {
      cartEntity.cartItems.add(CartItemEntity(productEntity: productEntity));
    }
    emit(CartProductAdded());
  }

  void removeProductFromCart(ProductEntity productEntity) {
    CartItemEntity cartItemEntity = cartEntity.getCartItem(productEntity);
    if (cartItemEntity.count > 1) {
      cartItemEntity.decrementCount();
      log('is count ${cartItemEntity.count}');
    } else {
      cartEntity.cartItems.remove(cartItemEntity);
    }
    emit(CartProductRemoved());
  }
}
