import 'package:e_commerce/core/widgets/custom_divider.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemsSliverListView extends StatelessWidget {
   CartItemsSliverListView({super.key});

  final List<CartItem> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const CustomDivider(),
      itemBuilder: (context, index) => index == cartItems.length - 1
          ? Column(children: [cartItems[index], const CustomDivider()])
          : cartItems[index],
      itemCount: cartItems.length,
    );
  }
}
