import 'package:e_commerce/core/utils/app_decorations.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class PaymentItemContainer extends StatelessWidget {
  const PaymentItemContainer({super.key,  this.title, required this.child , this.hasTitle = true});
  
  final String? title;
  final Widget child;
  final bool hasTitle ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hasTitle ? Column(
          children: [
            Text(title!, style: AppTextStyles.bold13,),
            const SizedBox(height: 16,),
          ],
        ) : const SizedBox(),
        Container(
          padding: const EdgeInsets.symmetric( vertical: 16 , horizontal: 8),
          decoration: AppDecorations.greyBoxDecoration,
          child: child,
        )
      ],
    );
  }
}