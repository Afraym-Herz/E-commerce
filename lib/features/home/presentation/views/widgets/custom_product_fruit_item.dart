import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/core/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';

class CustomProductFruitItem extends StatelessWidget {
  const CustomProductFruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 64,
          width: 64,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.lightObacityGrayColor,
          ),
          child: productEntity.imageUrl == Assets.imagesMango
              ? Image.asset(Assets.imagesMango)
              : const CustomNetworkImage(
                  imageUrl:
                      'https://ezpbrsbkjqkbclendlbt.supabase.co/storage/v1/object/public/fruit_images/images/1000000043.png',
                ),
        ),
        const SizedBox(height: 10),
        Text(productEntity.productName, style: AppTextStyles.semiBold13),
      ],
    );
  }
}
