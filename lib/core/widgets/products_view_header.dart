import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({
    super.key,
    required this.title,
    required this.productsLength,
  });
  final String title;
  final int productsLength;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$productsLength نتائج', style: AppTextStyles.bold16),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 40,
            width: 40,
            decoration: ShapeDecoration(
              shape: BoxBorder.all(color: const Color(0xffDDDFDF), width: 1),
              color: const Color(0xffF9FAFA),
            ),
            child: Image.asset(
              Assets.imagesArrowSwapHorizontal,
              color: AppColors.obacityGrayColor,
            ),
          ),
        ),
      ],
    );
  }
}
