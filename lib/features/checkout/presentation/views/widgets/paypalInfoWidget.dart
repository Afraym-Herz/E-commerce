import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:flutter/material.dart';

class PaypalInfoWidget extends StatelessWidget {
  const PaypalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text('وسيلة الدفع', style: AppTextStyles.bold13),
            Spacer(),
            Row(
              children: [
                Icon(Icons.edit, size: 18),
                SizedBox(width: 6),
                Text('تعديل', style: AppTextStyles.semiBold13),
              ],
            ),
          ],
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(left: 33),
              child: Text(
                '6522 **** **** ****',
                style: AppTextStyles.regular16,
              ),
            ),
            Image.asset(Assets.imagesPaypalImage),
          ],
        ),
      ],
    );
  }
}
