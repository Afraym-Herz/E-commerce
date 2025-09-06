import 'package:e_commerce/core/utils/app_decorations.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class PaymentItemContainer extends StatelessWidget {
  const PaymentItemContainer({super.key, required this.title, required this.child});
  
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.bold13,),
        const SizedBox(height: 16,),
        Container(
          decoration: AppDecorations.greyBoxDecoration,
          child: child,
        )
      ],
    );
  }
}