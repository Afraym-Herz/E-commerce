import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/cart_item_action_button.dart';
import 'package:flutter/material.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({
    super.key, required this.quantity,
  });
  final int quantity ;
  
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const CartItemActionButton(sizes: 26),
        const SizedBox(width: 20),
        Text(
          quantity.toString(),
          style: AppTextStyles.bold16,
        ),
        const SizedBox(width: 20),
        const CartItemActionButton(sizes: 26, isDelete: true),
      ],
    );
  }
}
