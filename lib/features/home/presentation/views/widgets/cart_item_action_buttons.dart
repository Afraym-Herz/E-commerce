import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/cart_item_action_button.dart';
import 'package:flutter/material.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CartItemActionButton(sizes: 26),
        SizedBox(width: 20),
        Text(
          '3',
          style: AppTextStyles.bold16,
        ),
        SizedBox(width: 20),
        CartItemActionButton(sizes: 26, isDelete: true),
      ],
    );
  }
}
