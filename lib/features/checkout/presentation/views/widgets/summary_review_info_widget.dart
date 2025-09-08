import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SummaryReviewInfoWidget extends StatelessWidget {
  const SummaryReviewInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('المجموع الفرعي :', style: AppTextStyles.regular13),
            const Spacer(),
            Text(
            '${context
                .read<OrderEntity>()
                .cartEntity
                .calcTotalPrice()
                .toString()} جنية',
              style: AppTextStyles.semiBold16,
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('التوصيل  :', style: AppTextStyles.regular13),
            Spacer(),
            Text('30 جنية', style: AppTextStyles.semiBold13),
          ],
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 45),
          child: Divider(thickness: .5),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text('المجموع الكلي :', style: AppTextStyles.bold16),
            const Spacer(),
            Text(
              '${(context
                .read<OrderEntity>()
                .cartEntity
                .calcTotalPrice()+30)
                .toString()} جنية',
              style: AppTextStyles.bold16,
            ),
          ],
        ),
      ],
    );
  }
}
