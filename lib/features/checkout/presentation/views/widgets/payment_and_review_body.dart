import 'package:e_commerce/features/checkout/presentation/views/widgets/delivery_address_widget.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/payment_item_container.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/paypalInfoWidget.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/summary_review_info_widget.dart';
import 'package:flutter/material.dart';

class PaymentAndReviewBody extends StatelessWidget {
  const PaymentAndReviewBody({super.key, required this.pageController});
  final PageController pageController ;

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
            child: DeliveryAddressWidget(
              pageController: pageController ,
            ), 
          ),
        ],
      ),
    );
  }
}
