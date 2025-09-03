import 'package:e_commerce/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:flutter/material.dart';

class StepItemsList extends StatelessWidget {
  StepItemsList({super.key, required this.currentIndex});
  int currentIndex ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(stepItemsTexts.length, (index) {
        return Expanded(
          child: StepItem(
            text: stepItemsTexts[index],
            index: index + 1,
            isActive: index == 0 || currentIndex >= index ,
          ),
        );
      }),
    );
  }

  final List<String> stepItemsTexts = const [
    'الشحن',
    'العنوان',
    'الدفع',
    'المراجعة',
  ];

}
