import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/assets.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/payment_item_container.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/paypalInfoWidget.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/review_info_widget.dart';
import 'package:flutter/material.dart';

class PaymentAndReviewBody extends StatelessWidget {
  const PaymentAndReviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          PaymentItemContainer(
            title: 'ملخص الطلب :',
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: ReviewInfoWidget(),
            ),
          ),
          SizedBox(height: 22),
          PaymentItemContainer(
            title: 'يرجي تأكيد  طلبك :',
            child: PaypalInfoWidget(),
          ),
          SizedBox(height: 8,),
          
          
        ],
      ),
    );
  }
}

