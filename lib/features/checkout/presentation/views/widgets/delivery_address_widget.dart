import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('عنوان التوصيل', style: AppTextStyles.bold13),
            const Spacer(),
            GestureDetector(
              onTap: () {
                pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOut,
                );
              },
              child: const Row(
                children: [
                  Icon(Icons.edit, size: 18),
                  SizedBox(width: 6),
                  Text('تعديل', style: AppTextStyles.semiBold13),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Image.asset(Assets.imagesLocationIcon),
            const SizedBox(width: 6),
            Text(
              context
                  .read<OrderEntity>()
                  .shippingAddressEntity
                  .addressDetails
                  .toString(),
              style: AppTextStyles.regular16,
            ),
          ],
        ),
      ],
    );
  }
}
