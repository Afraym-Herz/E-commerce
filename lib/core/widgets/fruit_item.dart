import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({
    super.key,
    required this.fruitImage,
    required this.fruitPrice,
    required this.fruitName,
  });
  final String fruitImage, fruitPrice, fruitName;

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
            SizedBox(height: 112, child: Image.asset(fruitImage)),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fruitName,
                      style: AppTextStyles.semiBold13.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 7),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "$fruitPrice جنية",
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
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(22),
                      ),
                      color: AppColors.primaryColor,
                    ),
                    child: const Icon(
                      Icons.add_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
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
