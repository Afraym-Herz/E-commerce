import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/cart_item_action_button.dart';
import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';
import 'package:flutter/material.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({
    super.key, required this.quantity, required this.cartItemEntity, });
  final int quantity ;
  final CartItemEntity cartItemEntity;
  
  
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
         CartItemActionButton( onPressed: cartItemEntity.incrementCount , sizes: 26),
        const SizedBox(width: 20),
        Text(
          quantity.toString(),
          style: AppTextStyles.bold16,
        ),
        const SizedBox(width: 20),
         CartItemActionButton( onPressed: cartItemEntity.decrementCount , sizes: 26, isDelete: true),
      ],
    );
  }
}
