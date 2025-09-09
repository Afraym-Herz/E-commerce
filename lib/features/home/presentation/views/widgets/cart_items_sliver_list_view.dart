import 'package:e_commerce/core/widgets/custom_divider.dart';
import 'package:e_commerce/features/home/domain/entites/cart_entity.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemsSliverListView extends StatelessWidget {
  const CartItemsSliverListView({super.key, required this.cartEntity});

  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const CustomDivider(),
      itemBuilder: (context, index) => index == cartEntity.cartItems.length - 1
          ? Column(
              children: [
                CartItem(cartItemEntity: cartEntity.cartItems[index]),
                const CustomDivider(),
              ],
            )
          : CartItem(cartItemEntity: cartEntity.cartItems[index]),
      itemCount: cartEntity.cartItems.length,
    );
  }
}
