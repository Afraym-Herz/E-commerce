import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/payment_item_container.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/paypalInfoWidget.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/summary_review_info_widget.dart';
import 'package:flutter/material.dart';

class PaymentAndReviewBody extends StatelessWidget {
  const PaymentAndReviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const PaymentItemContainer(
            title: 'ملخص الطلب :',
            child: SummaryReviewInfoWidget(),
          ),
          const SizedBox(height: 22),
          const PaymentItemContainer(
            title: 'يرجي تأكيد  طلبك :',
            child: PaypalInfoWidget(),
          ),
          const SizedBox(height: 12),
          PaymentItemContainer(
            hasTitle: false,
            child: Column(
              children: [
                const Row(
                  children: [
                    Text('عنوان التوصيل', style: AppTextStyles.bold13),
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
                const SizedBox(height: 12),
                Row(
                  children: [
                    Image.asset(Assets.imagesLocationIcon),
                    const SizedBox(width: 6),
                    const Text('شارع النيل، مبنى رقم ١٢٣' , style: AppTextStyles.regular16,),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
