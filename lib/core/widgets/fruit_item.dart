import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/core/widgets/cart_item_action_button.dart';
import 'package:e_commerce/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF3F5F7),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.favorite_border_rounded),
            ),
            SizedBox(
              height: 112,
              child: (productEntity.imageUrl!.isEmpty)
      ? Image.asset(Assets.imagesMango) // fallback
      : (productEntity.imageUrl!.startsWith("http") ||
         productEntity.imageUrl!.startsWith("https"))
          ? Image.network(
              "https://ezpbrsbkjqkbclendlbt.supabase.co/storage/v1/object/public/fruit_images/images/1000000043.png",
              fit: BoxFit.cover,
            )
          : Image.asset(
              Assets.imagesMango, // local asset
              fit: BoxFit.cover,
            ),
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productEntity.productName,
                      style: AppTextStyles.semiBold13.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 7),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${productEntity.productPrice} جنية",
                            style: AppTextStyles.semiBold13.copyWith(
                              color: AppColors.secondaryColor,
                              fontSize: 13,
                            ),
                          ),
                          TextSpan(
                            text: " / الكيلو",
                            style: AppTextStyles.semiBold13.copyWith(
                              color: AppColors.lightSecondaryColor,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 3),
                  ],
                ),
                const Spacer(),
                 Align(
                  alignment: Alignment.bottomLeft,
                  child: CartItemActionButton(
                    onPressed: (){
                      context.read<CartCubit>().addProductToCart(
                            productEntity,
                         );
                    },
                    sizes: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
