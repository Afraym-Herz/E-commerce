import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SummaryReviewInfoWidget extends StatelessWidget {
  const SummaryReviewInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Text('المجموع الفرعي :', style: AppTextStyles.regular13),
            Spacer(),
            Text('150 جنيه', style: AppTextStyles.semiBold16),
          ],
        ),
        SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('التوصيل  :', style: AppTextStyles.regular13),
            Spacer(),
            Text('30جنية', style: AppTextStyles.semiBold13),
          ],
        ),
        SizedBox(height: 8,),
        Padding(
          padding: EdgeInsets.symmetric( horizontal: 45),
          child: Divider(thickness: .5,),
        ),
        SizedBox(height: 8,),
        Row(
          children: [
            Text('المجموع الكلي :', style: AppTextStyles.bold16  ),
            Spacer(),
            Text('180 جنيه', style: AppTextStyles.bold16  ),
          ],
        ),
      ],
    );
  }
}
