import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/cart_item_action_button.dart';
import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';
import 'package:e_commerce/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({
    super.key,
    required this.quantity,
    required this.cartItemEntity,
  });
  final int quantity;
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return Row(
          children: [
            CartItemActionButton(
              onPressed: () {
                cartItemEntity.incrementCount();
                context.read<CartItemCubit>().updateCartItem(cartItemEntity);
              },
              sizes: 26,
            ),
            const SizedBox(width: 20),
            Text(quantity.toString(), style: AppTextStyles.bold16),
            const SizedBox(width: 20),
            CartItemActionButton(
              onPressed: cartItemEntity.count == 1
                  ? () {
                      context.read<CartCubit>().removeCartItemEntity(
                        cartItemEntity,
                      );
                    }
                  : () {
                      cartItemEntity.decrementCount();
                      context.read<CartItemCubit>().updateCartItem(
                        cartItemEntity,
                      );
                    },
              sizes: 26,
              isDelete: true,
            ),
          ],
        );
      },
    );
  }
}
