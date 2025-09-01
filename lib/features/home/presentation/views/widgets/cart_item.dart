import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/features/home/domain/entites/cart_item_entity.dart';
import 'package:e_commerce/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.12,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 73,
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
              child: (cartItemEntity.productEntity.imageUrl!.startsWith("http"))
                  ? Image.network(
                      "https://ezpbrsbkjqkbclendlbt.supabase.co/storage/v1/object/public/fruit_images/images/1000000049.png",
                      fit: BoxFit.cover,
                    )
                  : Image.asset(Assets.imagesMango, fit: BoxFit.cover),
            ),
            const SizedBox(width: 17),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          cartItemEntity.productEntity.productName,
                          style: AppTextStyles.bold13,
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(Assets.imagesTrash),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${cartItemEntity.productEntity.unitAmount} كم',
                        style: AppTextStyles.regular13.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        CartItemActionButtons(
                          onTapAddedButton: () {
                            context.read<CartCubit>().addProductToCart(
                              cartItemEntity.productEntity,
                            );
                          },
                          onTapRemovedButton: () {
                            context.read<CartCubit>().removeProductFromCart(
                              cartItemEntity.productEntity,
                            );
                          },
                          quantity: cartItemEntity.count,
                        ),
                        const Spacer(),
                        Text(
                          '${cartItemEntity.calcTotalPriceItem()} جنيه ',
                          style: AppTextStyles.bold16.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
